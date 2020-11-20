package com.juncheng.experiment.util;

import java.lang.instrument.Instrumentation;

public class ObjectUtil {
    private static volatile Instrumentation instrument;

    public static void premain(String args, Instrumentation inst) {
        instrument = inst;
    }

    public static Long getSizeOf(Object object) {
        if (instrument == null) {
            throw new IllegalStateException("Instrumentation is null");
        }
        return instrument.getObjectSize(object);
    }
}
