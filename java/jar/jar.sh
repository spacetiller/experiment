jar cvf test.jar test1.class test2.class Main.class
jar xf test.jar META-INF/MANIFEST.MF
jar uf test.jar META-INF/MANIFEST.MF
java -jar test.jar
jar cvfm test1.jar MANIFEST.MF -C target/ .
