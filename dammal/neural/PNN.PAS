
 { *****  PNN  *****  (Pete's Neural Net)

   This program simulates a 3 or 4-layer Neural Network, and can be used to
   simulate an arbitrary, complex, or non-linear function that would be
   difficult to implement by traditional methods. The Back Propagation
   method is used "teach" the network the desired function.
   Adjacent layers of the net are fully interconnected; that is, every
   neuron in layer 1 is connected to every neuron in layer 2, and every
   neuron in layer 2 is connected to every neuron in layer 3 (1->2, 2->3).
   With a 4-layer net, there is further interconnection: 1->2, 1->3, 2->3,
   2->4, 3->4.

   Each neuron implements the following function:

				1
		   X  =  ----------------   ,
			  1 + exp( -GS )

   where G is a constant called the "sigmoid factor" (usually 1.0),
   where X is the output of the neuron,
   where S is the sum of the inputs to the neuron:

		   S  =  sum [ Xp * W ]   ,

   where Xp is the output of a previous neuron, and W is the weight on the
   link between a previous neuron and the current neuron.

   In addition to standard back-propagation style networks, PNN also does a
   simplified variation of the Cascade-Correllation Method described by
   Fahlman and Lebiere (see the "SC" command, described below).

   PNN reads all of it's configuration and learning data from a single file
   which is specified by the user. This 'source file' may contain various
   commands, which are indicated by the first two letters on a line in the file.

   Following is a description of each command:
   ;
     Comment. The line is ignored.
   SN l1 n1 n2 [n3] n4
     Network dimensions: l1 is the number of layers (3 or 4), nx is the number
     of neurons in the Input, Hidden, and Output layers.
   SC l1 n1 n2 n3
     Network dimensions for a cascade-mode network: the number of layers
     (must be 3), the number of neurons in the Input, Hidden, and Output
     layers. The number for the "Hidden" neurons is actually the Maximum
     number - cascade mode always starts with just one. There will
     automatically be one "bias" neuron in the first layer.
     The Cascade mode requires the use of the AL (Auto Learn) command (see
     below) for training. In this mode, the PL command only sets the error
     threshold.
   CA n
     The number of cascaded neurons that have been trained. This command will
     appear in the log file when doing Cascade training, and is only useful
     when reloading a previously-trained cascaded network.
   SB n
     The number of bias neurons to place at the input. The bias neurons have
     a fixed output of 1.0, and appear in the network in the same position
     as regular inputs.
   IC n1 n2
     Iterations control. n1 is the max number of epochs to perform, n2 is
     how often to report the learning error value.
   XR n1 n2
     Input value range. This specifies that the input will vary between a
     min of n1, and a max of n2. If there are any XR commands used at all,
     then there must be one for each input. If no XR commands are found, then
     PNN will determine the mins and maxs automatically, based on the training
     data. PNN needs a min and max value so that it can scale the Learning
     and Test case input values to be in the range of -1 to +1.
   YR n1 n2
     Output value range. This specifies that the output will vary between a
     min of n1, and a max of n2. If there are any YR commands used at all,
     then there must be one for each output. If no YR commands are found, then
     PNN will determine the mins and maxs automatically, based on the training
     data. PNN needs a min and max value so that it can scale the Learning
     and Test case output values to be in the range of 0 to +1.
   RN n1
     Randomize the network, with a random seed of n1. Normally done before
     learning begins.
   PP n1 n2 n3
     Set the learning parameters. "n1" is the learning rate: how big of a step
     should we take between each interation. "n2" is the learning momentum: how
     quickly should we change directions. "n3" is the sigmoid factor: the shape
     of the neuron's sigmoid curve. If "n2" is 1.0, then PNN will reduce the
     momentum automatically during training, starting at a value of 0.8.
   PL n1 n2 n3
     Begin normal learning. "n1" is the learning threshold: stop learning when
     the error drops below this value. "n2" is the max error to be displayed
     on the graph, and "n3" is the minimum. In Cascade mode, this command does
     NOT begin the learning process, but simply sets the learning threshold.
   AL n1 n2 n3
     Performs all of the functions of the IC, PP, and PL commands
     automatically. Any important parameters that have not been explicitly
     defined will take on a default value.
     The parameter "n1" determines how many iterations that PNN should perform
     without making more than 1% progress; after which it will quit. "n1" can
     be between 1 and 1000. "n2" is the max error to be displayed on the graph,
     and "n3" is the minimum. This command is the only way to begin the
     learning process when using Cascade mode.
   SA n
     Perform Simulated Annealing. We will reduce the "temperature" (which
     is momentum X learning rate) by 5%, and learn for 10 epochs, and
     then repeat the process until we have exceeded "n" epochs. This
     command is normally used after normal learning is complete.
   VA
     Validate by using the Test cases (see T below). Log the expected and
     actual value for each T case.
   WC n
     Show which of the Learning cases had the worst error. The error of
     each of the cases is measured, then the list is sorted (worst first),
     then the values are written to the log. The parameter "n" determines how
     many cases to log; -1 will log all cases. This function will help you
     identify which of the Learning cases may contain bad data.
   DM
     Dump the contents of the network (the weight values) to the log. The
     weights are dumped using the CV command (see below), to make them
     easy to reload.
   CV n1..nm
     Load a connection value (weight) into the net. Can be used to restore
     a net to a previous condition, without re-learning. Each CV command
     restores only a single weight, so normally there are many of these.
     There are several parameters that specify the location of the weight
     in the network, then the last parameter is the weight's value.
   DL
     Similar to DM above, except that we log only the links between
     the inputs and the 1st hidden layer, with the weights grouped
     according to which Hidden Layer Neuron they are connected to. This is
     useful for studying the function that each neuron performs in the net.
   DF
     Same as DL, except that the values are smoothed by a moving-average
     filter, so that they look better when plotted.
   NF n
     Creates a separate file named fname_Ln.DMP which contains values for the
     outputs of the neurons in the specified layer, while using the Learn cases
     as input data. This puts the data in a convenient file for plotting.
     The parameter 'n' specifies which layer we want to see. This is useful for
     studying the function that each neuron performs in the net.
   IO n1 d1..dn
     Input sensitivity check. Creates a separate file named fname_ISO.DAT
     which contains network output values while all except one input is held
     constant. The fixed inputs are held at a value specified by the parameters
     d1 through dn. The varying input changes linearly from -1 to +1, in ten
     steps. So, input 1 will be varied to produce 10 outputs, then input 2
     will be varied, etc. The parameter n1 specifies which output will be
     monitored.
   IS d1..dn
     Input sensitivity check. Creates a separate file named fname_ISS.DAT
     which contains network output values while all except one input is held
     constant. The fixed inputs are held at a value specified by the parameters
     d1 through dn. The varying input changes linearly from -1 to +1, in ten
     steps. So, input 1 will be varied to produce 10 outputs, then input 2
     will be varied, etc. The average of ALL the outputs at each step is
     monitored, so there is no parameter for specifying the monitored
     output. This function is best for determining which inputs have NO effect
     on ANY output.
   I2 n1 d1..dn
     Input sensitivity check. Creates a separate file named fname_IS2.DAT
     which contains network output values while all except two inputs are held
     constant. The fixed inputs are held at the values specified by
     parameters d1..dn. The varying inputs change from -1 to +1, in several
     steps. The first parameter (n1) specifies which output will be monitored.
     This function is similar to IO, except that we are looking for two inputs
     that have a strong inter-dependency.
   L n1..nx n1..ny
     [ Note: the L and T commands are only a single letter. ]
     A learning example. A set of values for each input, followed by the
     output value(s). These are the cases that PNN uses to learn the function.
   T n1..nx n1..ny
     A testing example. A set of values for each input, followed by the
     output value(s). These are the cases that we use to check how well the
     net has learned the function.

   The following commands are sensitive to what order they appear in the file:
   [ RN,PL,VA,DM,CV,DL,DF,NF,IS,I2 ], since they are executed in the order
   that they appear. The other commands can be distributed arbitrarily,
   although it makes sense to put the L and T commands last.

   Note that most of these commands may be used more than once. For example:
   . . .
   PP 0.010
   VA
   PP 0.005
   VA
   This sequence will train to an error of 0.01, show the results, then train
   further down to 0.005, and show the results again.
 }


program PNN;

uses
  DOS,
  CRT,
  Graph,
  PNN_Lib;

const
  maxA          = 32;
  maxB          = 20;
  maxC          = 20;
  initial_color = Yellow;

type
  ptr_real  = ^real;

var
  plot        : aplot;
  U,
  M,
  G,
  OE,
  sumE,
  avgE,
  lastavgE,
  graph_min,
  graph_max,
  worst_error,
  maxE,
  tolerance : real;
  ddfile,
  dfile,
  tfile : text;
  a_size,
  b1_size,
  b2_size,
  c_size,
  b1d_size,
  b2da_size,
  b2d_size,
  cdb1_size,
  cd_size,
  noof_in,
  noof_t,
  max_iter,
  biases,
  noof_casc,
  randomseed,
  lfreq,
  count,
  next  : integer;
  worst_color,
  color : word;
  layers4,
  cascade,
  auto_momentum,
  ddone : boolean;
  tstr  : string;
  fname,
  vs    : vstring;
  xsd,
  xm   : array [1..maxA] of real;
  ysd,
  ym   : array [1..maxC] of real;
  x    : array [1..maxA*2] of ptr_real;
  y    : array [1..maxC*2] of ptr_real;
  a    : array [1..maxA] of ptr_real;
  Em1,
  b1sum,
  b1,
  Em2,
  b2sum,
  b2   : array [1..maxB] of ptr_real;
  Eo,
  csum,
  z,
  c    : array [1..maxC] of ptr_real;
  b1dd,
  b1d,
  b2dad,
  b2da  : array [1..maxA*maxB] of ptr_real;
  cdb1d,
  cdb1  : array [1..maxB*maxC] of ptr_real;
  b2dd,
  b2d   : array [1..maxB*maxB] of ptr_real;
  cdd,
  cd    : array [1..maxB*maxC] of ptr_real;
  s2    : string[2];

  {$M 32768,0,655360 }


procedure Allocate_Heap;

var
  kk : integer;

begin
  for kk := 1 to (a_size*2) do New( x[kk] );
  for kk := 1 to (c_size*2) do New( y[kk] );
  for kk := 1 to a_size do New( a[kk] );
  for kk := 1 to b1_size do
    begin
      New( Em1[kk] );
      New( b1sum[kk] );
      New( b1[kk] );
    end;
  if layers4 then
    for kk := 1 to b2_size do
      begin
        New( Em2[kk] );
        New( b2sum[kk] );
        New( b2[kk] );
      end;
  for kk := 1 to c_size do
    begin
      New( Eo[kk] );
      New( csum[kk] );
      New( z[kk] );
      New( c[kk] );
    end;
  for kk := 1 to b1d_size do
    begin
      New( b1dd[kk] );
      New( b1d[kk] );
    end;
  if layers4 then
    begin
      for kk := 1 to b2d_size do
        begin
          New( b2dd[kk] );
          New( b2d[kk] );
        end;
      for kk := 1 to b2da_size do
        begin
          New( b2dad[kk] );
          New( b2da[kk] );
        end;
      for kk := 1 to cdb1_size do
        begin
          New( cdb1d[kk] );
          New( cdb1[kk] );
        end;
    end;
  for kk := 1 to cd_size do
    begin
      New( cdd[kk] );
      New( cd[kk] );
    end;

end;


procedure Random_Net;
var
  kk : integer;
begin
  Randomize;
  read( dfile, RandSeed );

  for kk := 1 to b1d_size do
    begin
      b1d[kk]^ := (Random * 2) - 1;
      b1dd[kk]^ := 0;
    end;
  if layers4 then
    begin
      for kk := 1 to b2d_size do
        begin
          b2d[kk]^ := (Random * 2) - 1;
          b2dd[kk]^ := 0;
        end;
      for kk := 1 to b2da_size do
        begin
          b2da[kk]^ := (Random * 2) - 1;
          b2dad[kk]^ := 0;
        end;
      for kk := 1 to cdb1_size do
        begin
          cdb1[kk]^ := (Random * 2) - 1;
          cdb1d[kk]^ := 0;
        end;
    end;
  for kk := 1 to cd_size do
    begin
      cd[kk]^ := (Random * 2) - 1;
      cdd[kk]^ := 0;
    end;
  for kk := 1 to b1_size do
    begin
      b1sum[kk]^ := 0;
      b1[kk]^ := 0;
      Em1[kk]^ := 1.0;
    end;
  if layers4 then
    for kk := 1 to b2_size do
      begin
        b2sum[kk]^ := 0;
        b2[kk]^ := 0;
        Em2[kk]^ := 1.0;
      end;
  for kk := 1 to c_size do
    begin
      csum[kk]^ := 0;
      c[kk]^ := 0;
      Eo[kk]^ := 1.0;
    end;

end; { Random_Net }


procedure Set_Ranges;

var
  jj : integer;

procedure Load_L_Range;
var
  kk : integer;
  val : real;
begin
  repeat
    if not eof(ddfile) then read( ddfile, ch );
    if (ch <> 'L') and (not eof(ddfile)) then readln( ddfile );
  until (ch = 'L') or eof(ddfile);

  if not eof(ddfile) then
    begin
      for kk := 1 to a_size do
        begin
          read( ddfile, val );
          if val < x[kk*2-1]^ then x[kk*2-1]^ := val;
          if val > x[kk*2]^   then x[kk*2]^   := val;
        end;
      for kk := 1 to c_size do
        begin
          read( ddfile, val );
          if val < y[kk*2-1]^ then y[kk*2-1]^ := val;
          if val > y[kk*2]^   then y[kk*2]^   := val;
        end;
    end;
end; { Load_L_Range }

begin { Set_Ranges }
  for kk := 1 to a_size do
    begin
      x[kk*2-1]^ := maxint;
      x[kk*2]^   := -maxint;
    end;
  for kk := 1 to c_size do
    begin
      y[kk*2-1]^ := maxint;
      y[kk*2]^   := -maxint;
    end;

  reset( ddfile );
  repeat
    Load_L_Range;
  until eof(ddfile);

  for kk := 1 to a_size do
    if x[kk*2-1]^ = x[kk*2]^ then
      x[kk*2]^ := x[kk*2]^ + 0.0001;
  for kk := 1 to c_size do
    if y[kk*2-1]^ = y[kk*2]^ then
      y[kk*2]^ := y[kk*2]^ + 0.0001;

end; { Set_Ranges }



function neuron( sum: real ):real;
{ Implement the function of a neuron.
}
begin
  neuron := 1 / ( 1 + exp(-G * sum) );
end;


procedure Process;

var
  jj,
  kk : integer;

begin
  for kk := 1 to b1_size do
    begin
      for jj := 1 to a_size do
        b1sum[kk]^ := b1sum[kk]^ + ( b1d[ jj + ((kk-1)*a_size) ]^ * a[jj]^ );
      if b1sum[kk]^ > 25 then b1sum[kk]^ := 25;
      if b1sum[kk]^ < -25 then b1sum[kk]^ := -25;
      b1[kk]^ := neuron( b1sum[kk]^ );
      b1sum[kk]^ := b1[kk]^ * (1.0 - b1[kk]^);
    end;

  if layers4 then
    for kk := 1 to b2_size do
      begin
        for jj := 1 to a_size do
          b2sum[kk]^ := b2sum[kk]^ + ( b2da[ jj + ((kk-1)*a_size) ]^ * a[jj]^ );
        for jj := 1 to b1_size do
          b2sum[kk]^ := b2sum[kk]^ + ( b2d[ jj + ((kk-1)*b1_size) ]^ * b1[jj]^ );
        if b2sum[kk]^ > 25 then b2sum[kk]^ := 25;
        if b2sum[kk]^ < -25 then b2sum[kk]^ := -25;
        b2[kk]^ := neuron( b2sum[kk]^ );
        b2sum[kk]^ := b2[kk]^ * (1.0 - b2[kk]^);
      end;

  if not layers4 then
    for kk := 1 to c_size do
      begin
        for jj := 1 to b1_size do
          csum[kk]^ := csum[kk]^ + ( cd[ jj + ((kk-1)*b1_size) ]^ * b1[jj]^ );
        if csum[kk]^ > 25 then csum[kk]^ := 25;
        if csum[kk]^ < -25 then csum[kk]^ := -25;
        c[kk]^ := neuron( csum[kk]^ );
        csum[kk]^ := c[kk]^ * (1.0 - c[kk]^);
      end;

  if layers4 then
    for kk := 1 to c_size do
      begin
        for jj := 1 to b1_size do
          csum[kk]^ := csum[kk]^ + ( cdb1[ jj + ((kk-1)*b1_size) ]^ * b1[jj]^ );
        for jj := 1 to b2_size do
          csum[kk]^ := csum[kk]^ + ( cd[ jj + ((kk-1)*b2_size) ]^ * b2[jj]^ );
        if csum[kk]^ > 25 then csum[kk]^ := 25;
        if csum[kk]^ < -25 then csum[kk]^ := -25;
        c[kk]^ := neuron( csum[kk]^ );
        csum[kk]^ := c[kk]^ * (1.0 - c[kk]^);
      end;

  OE := 0;
  for kk := 1 to c_size do
    begin
      Eo[kk]^ := z[kk]^ - c[kk]^;
      OE := OE + (sqr(Eo[kk]^));
      csum[kk]^ := csum[kk]^ * Eo[kk]^;
    end;
  OE := OE / c_size;

end; { Process }


procedure Cascade_Process;

var
  t1, t2, kk, jj : integer;

begin
  t1 := a_size-b1_size+1;
  for kk := 1 to noof_casc do
    begin
      t2 := kk + t1;
      for jj := (t1+1) to a_size do
        if jj < t2 then a[jj]^ := b1[t2-jj]^
        else            a[jj]^ := 0.0;
      for jj := 1 to a_size do
        b1sum[kk]^ := b1sum[kk]^ + ( b1d[ jj + ((kk-1)*a_size) ]^ * a[jj]^ );
      if b1sum[kk]^ > 25 then b1sum[kk]^ := 25;
      if b1sum[kk]^ < -25 then b1sum[kk]^ := -25;
      b1[kk]^ := neuron( b1sum[kk]^ );
      b1sum[kk]^ := b1[kk]^ * (1.0 - b1[kk]^);
    end;

  for kk := 1 to c_size do
    begin
      for jj := 1 to noof_casc do
        csum[kk]^ := csum[kk]^ + ( cd[ jj + ((kk-1)*b1_size) ]^ * b1[jj]^ );
      if csum[kk]^ > 25 then csum[kk]^ := 25;
      if csum[kk]^ < -25 then csum[kk]^ := -25;
      c[kk]^ := neuron( csum[kk]^ );
      csum[kk]^ := c[kk]^ * (1.0 - c[kk]^);
    end;

  OE := 0;
  for kk := 1 to c_size do
    begin
      Eo[kk]^ := z[kk]^ - c[kk]^;
      OE := OE + (sqr(Eo[kk]^));
      csum[kk]^ := csum[kk]^ * Eo[kk]^;
    end;
  OE := OE / c_size;

end; { Cascade_Process }


procedure Process_SA;

var
  jj,
  kk : integer;
  b1sum,
  b2sum,
  csum  : real;

begin
  for kk := 1 to b1_size do
    begin
      b1sum := 0;
      for jj := 1 to a_size do
        b1sum := b1sum + ( b1d[ jj + ((kk-1)*a_size) ]^ * a[jj]^ );
      if b1sum > 25 then b1sum := 25;
      if b1sum < -25 then b1sum := -25;
      b1[kk]^ := neuron( b1sum );
    end;

  if layers4 then
    for kk := 1 to b2_size do
      begin
        b2sum := 0;
        for jj := 1 to a_size do
          b2sum := b2sum + ( b2da[ jj + ((kk-1)*a_size) ]^ * a[jj]^ );
        for jj := 1 to b1_size do
          b2sum := b2sum + ( b2d[ jj + ((kk-1)*b1_size) ]^ * b1[jj]^ );
        if b2sum > 25 then b2sum := 25;
        if b2sum < -25 then b2sum := -25;
        b2[kk]^ := neuron( b2sum );
      end;

  if not layers4 then
    for kk := 1 to c_size do
      begin
        csum := 0;
        for jj := 1 to b1_size do
          csum := csum + ( cd[ jj + ((kk-1)*b1_size) ]^ * b1[jj]^ );
        if csum > 25 then csum := 25;
        if csum < -25 then csum := -25;
        c[kk]^ := neuron( csum );
      end;

  if layers4 then
    for kk := 1 to c_size do
      begin
        csum := 0;
        for jj := 1 to b1_size do
          csum := csum + ( cdb1[ jj + ((kk-1)*b1_size) ]^ * b1[jj]^ );
        for jj := 1 to b2_size do
          csum := csum + ( cd[ jj + ((kk-1)*b2_size) ]^ * b2[jj]^ );
        if csum > 25 then csum := 25;
        if csum < -25 then csum := -25;
        c[kk]^ := neuron( csum );
      end;

end; { Process_SA }


procedure Cascade_Process_SA;

var
  t1, t2, jj, kk : integer;
  b1sum,
  b2sum,
  csum  : real;

begin
  t1 := a_size-b1_size+1;
  for kk := 1 to noof_casc do
    begin
      b1sum := 0;
      t2 := kk + t1;
      for jj := (t1+1) to a_size do
        if jj < t2 then a[jj]^ := b1[t2-jj]^
        else            a[jj]^ := 0.0;
      for jj := 1 to a_size do
        b1sum := b1sum + ( b1d[ jj + ((kk-1)*a_size) ]^ * a[jj]^ );
      if b1sum > 25 then b1sum := 25;
      if b1sum < -25 then b1sum := -25;
      b1[kk]^ := neuron( b1sum );
    end;

  for kk := 1 to c_size do
    begin
      csum := 0;
      for jj := 1 to noof_casc do
        csum := csum + ( cd[ jj + ((kk-1)*b1_size) ]^ * b1[jj]^ );
      if csum > 25 then csum := 25;
      if csum < -25 then csum := -25;
      c[kk]^ := neuron( csum );
    end;

end; { Cascade_Process_SA }


procedure Show_Output_File( kk: integer; var expected, actual: real );
var
  jj     : integer;
begin
  jj := (kk-1) * 2 + 1;
  write( tfile, ';', kk:1, ' Exp.: ' );
  expected := y[jj+1]^*z[kk]^ - y[jj]^*z[kk]^ + y[jj]^;
  write( tfile, expected:5:3, '  Act.: ' );
  actual := y[jj+1]^*c[kk]^ - y[jj]^*c[kk]^ + y[jj]^;
  writeln( tfile, actual:6:3, '  Diff.: ', (actual-expected):5:3 );
end; { Show_Output_File }


procedure Teach( U,M,G: real );

var
  i, kk, jj : integer;

begin
  if not layers4 then
    begin
      { Adjust the links between the middle and output layers. }
      for kk := 1 to b1_size do
        begin
          Em1[kk]^ := 0;
          for jj := 1 to c_size do
            begin
              { Calculate the index of the link. }
              i := ( (jj-1) * b1_size ) + kk;
              { Change the link. }
              Em1[kk]^ := Em1[kk]^ + (csum[jj]^ * cd[i]^);
              cdd[i]^ := (M * cdd[i]^) + (U * csum[jj]^ * b1[kk]^);
              cd[i]^  := cd[i]^ + cdd[i]^;
            end;
        end;
      for kk := 1 to b1_size do b1sum[kk]^ := b1sum[kk]^ * Em1[kk]^;
    end;

  if layers4 then
    begin
      { Adjust the links between the 3rd and 4th layers. }
      for kk := 1 to b2_size do
        begin
          Em2[kk]^ := 0;
          for jj := 1 to c_size do
            begin
              { Calculate the index of the link. }
              i := ( (jj-1) * b2_size ) + kk;
              { Change the link. }
              Em2[kk]^ := Em2[kk]^ + (csum[jj]^ * cd[i]^);
              cdd[i]^ := (M * cdd[i]^) + (U * csum[jj]^ * b2[kk]^);
              cd[i]^  := cd[i]^ + cdd[i]^;
            end;
        end;
      for kk := 1 to b2_size do b2sum[kk]^ := b2sum[kk]^ * Em2[kk]^;

      { Adjust the links between the 2nd and (3rd and 4th) layers. }
      for kk := 1 to b1_size do
        begin
          Em1[kk]^ := 0;
          for jj := 1 to b2_size do
            begin
              { Calculate the index of the link. }
              i := ( (jj-1) * b1_size ) + kk;
              { Change the link. }
              Em1[kk]^ := Em1[kk]^ + (b2sum[jj]^ * b2d[i]^);
              b2dd[i]^ := (M * b2dd[i]^) + (U * b2sum[jj]^ * b1[kk]^);
              b2d[i]^  := b2d[i]^ + b2dd[i]^;
            end;
          for jj := 1 to c_size do
            begin
              { Calculate the index of the link. }
              i := ( (jj-1) * b1_size ) + kk;
              { Change the link. }
              Em1[kk]^ := Em1[kk]^ + (csum[jj]^ * cdb1[i]^);
              cdb1d[i]^ := (M * cdb1d[i]^) + (U * csum[jj]^ * b1[kk]^);
              cdb1[i]^  := cdb1[i]^ + cdb1d[i]^;
            end;
        end;
      for kk := 1 to b1_size do b1sum[kk]^ := b1sum[kk]^ * Em1[kk]^;
    end;

  { Adjust the links between the 1st and (2nd and 3rd) layers. }
  for kk := 1 to a_size do
    begin
      for jj := 1 to b1_size do
        begin
          { Calculate the index of the link. }
          i := ( (jj-1) * a_size ) + kk;
          { Change the link. }
          b1dd[i]^ := (M * b1dd[i]^) + (U * b1sum[jj]^ * a[kk]^);
          b1d[i]^  := b1d[i]^ + b1dd[i]^;
        end;
      if layers4 then
        for jj := 1 to b2_size do
          begin
            { Calculate the index of the link. }
            i := ( (jj-1) * a_size ) + kk;
            { Change the link. }
            b2dad[i]^ := (M * b2dad[i]^) + (U * b2sum[jj]^ * a[kk]^);
            b2da[i]^  := b2da[i]^ + b2dad[i]^;
          end;
    end;
end; { Teach }


procedure Cascade_Teach( U,M,G: real );

var
  i, kk, jj : integer;
  t1 : real;

begin
  { Adjust the links between the middle and output layers. }
  for kk := 1 to noof_casc do
    begin
      Em1[kk]^ := 0;
      for jj := 1 to c_size do
        begin
          { Calculate the index of the link. }
          i := ( (jj-1) * b1_size ) + kk;
          { Change the link. }
          Em1[kk]^ := Em1[kk]^ + (csum[jj]^ * cd[i]^);
          cdd[i]^ := (M * cdd[i]^) + (U * csum[jj]^ * b1[kk]^);
          cd[i]^  := cd[i]^ + cdd[i]^;
        end;
    end;
  for kk := 1 to noof_casc do b1sum[kk]^ := b1sum[kk]^ * Em1[kk]^;

  { Adjust the links between the 1st and 2nd layers. }
  if noof_casc = 1 then a[a_size]^ := 0.0
  else                  a[a_size]^ := b1[noof_casc-1]^;
  jj := noof_casc;
  t1 := U * b1sum[noof_casc]^;
  for kk := 1 to a_size do
    begin
      { Calculate the index of the link. }
      i := ( (jj-1) * a_size ) + kk;
      { Change the link. }
      b1dd[i]^ := (M * b1dd[i]^) + (t1 * a[kk]^);
      b1d[i]^  := b1d[i]^ + b1dd[i]^;
    end;

end; { Cascade_Teach }


procedure Load_Example( et: char );

var
  kk  : integer;
  val : real;

begin
  repeat
    if not eof(ddfile) then read( ddfile, ch );
    if (ch <> et) and (not eof(ddfile)) then readln( ddfile );
  until (ch = et) or eof(ddfile);

  if not eof(ddfile) then
    begin
      for kk := 1 to (a_size-biases) do
        begin
          read( ddfile, val );
          a[kk]^ := (val-x[kk*2-1]^) / (x[kk*2]^-x[kk*2-1]^);
          a[kk]^ := a[kk]^ * 2 - 1;
        end;
      for kk := 1 to c_size do
        begin
          read( ddfile, val );
          z[kk]^ := (val-y[kk*2-1]^) / (y[kk*2]^-y[kk*2-1]^);
        end;
    end;
end; { Load_Example }


procedure Learned_Worst;

const
  max_cases = 700;

var
  kk,jj : integer;
  reg_color : word;
  y, ybot, e, OE : real;
  ch   : char;
  err  : array [1..max_cases] of real;
  done : boolean;

begin
  reset( ddfile );
  jj := 0;
  done := false;
  repeat
    Load_Example( 'L' );
    jj := jj + 1;
    if jj = max_cases then done := true;
    if not eof(ddfile) then readln( ddfile, tstr );
    if not cascade then Process_SA
    else                Cascade_Process_SA;
    OE := 0;
    for kk := 1 to c_size do
      OE := OE + (sqr( z[kk]^ - c[kk]^ ) );
    err[jj] := OE;
  until eof(ddfile) or done;

  repeat
    done := true;
    for kk := 1 to jj-1 do
      if err[kk] < err[kk+1] then
        begin
          e         := err[kk];
          err[kk]   := err[kk+1];
          err[kk+1] := e;
          done := false;
        end;
  until done;

  { Make a graph in the upper-right corner of the screen which shows the
    errors of each Learning example.
  }
  { Determine top of the graph's scale, and label it. }
  if worst_error < 0.000001 then
    begin
      worst_error := err[1];
      Str( worst_error:5:3, tstr );
      plot.labelXY( tstr, 350, graph_min+(graph_max-graph_min)*0.98 );
    end;

  if video_mode = CGA then ybot := (graph_max+graph_min) / 2
  else ybot := graph_min + (graph_max-graph_min)*0.67;
  { Draw an X-axis. }
  for kk := 400 to GetMaxX do plot.val(kk, ybot );
  { Plot the values from the err[] array. }
  if video_mode > CGA then
    begin
      reg_color := color;
      plot.set_color( worst_color );
      worst_color := worst_color + 1;
      if worst_color = 16 then worst_color := 2;
    end;
  for kk := 1 to jj do
    begin
      y := err[kk] * ((graph_max-ybot) / worst_error) + ybot;
      plot.val( round(400 + ((kk / jj) * (GetMaxX-400))), y );
    end;
  if video_mode > CGA then plot.set_color( reg_color );

  if cascade then { Display the # of cascades in the lower right corner. }
    begin
      Str( noof_casc:2, tstr );
      tstr := 'Casc:' + tstr;
      plot.label_lower_right( tstr );
    end;

end; { Learned_Worst }


procedure Do_Learn( iters: integer; var quit: boolean );

var
  lcount, jj : integer;

begin
  lcount := 0;
  if lfreq < 1 then lfreq := 1;
  jj := 0;

  reset( ddfile );
  Load_Example( 'L' );
  if not cascade then Process
  else                Cascade_Process;
  done := false;
  repeat
    if not cascade then Teach( U, M, G )
    else                Cascade_Teach( U, M, G );
    jj := jj + 1;
    if jj > noof_in then
      begin
        count := count + 1;
        lcount := lcount + 1;
        iters := iters - 1;
        if ddone then quit := true;
        ddone := true;
        jj := 1;
        lastavgE := avgE;
        avgE := sumE / noof_in;
        sumE := 0;

        if video_mode > CGA then
          begin
            if (count mod GetMaxX) = 0 then color := color + 1;
            if color = 16 then color := 2;
            plot.set_color( color );
          end;
        plot.val( (count mod GetMaxX), avgE );
        Str( avgE:6:4, tstr );
        tstr := 'Error: ' + tstr;
        if video_mode > CGA then plot.set_color( Green );
        plot.label_lower_left( tstr );
        Str( count:1, tstr );
        tstr := 'Iteration: ' + tstr + '       ';
        plot.label_lower_middle( tstr );

        if (count mod lfreq) < 1 then
          begin
            writeln( tfile, '; Epoch: ', count:1, ', Worst Error: ', maxE:7:5,
              ', Avg Error: ', avgE:7:5 );
            Learned_Worst;
          end;
        maxE := 0;
        if iters = 0 then done := true;
        if auto_momentum then
          if (count mod 10) = 0 then
            begin
              if avgE > lastavgE then
                begin
                  M := M * 0.95;
                  { report momentum here }
                end;
            end;
        reset( ddfile );
        if KeyPressed then quit := true;
        if quit then plot.label_lower_middle( 'Quitting - please wait' );
      end;
    Load_Example( 'L' );
    if not cascade then Process
    else                Cascade_Process;
    sumE := sumE + OE;
    if OE > maxE then maxE := OE;
    if avgE > tolerance then ddone := false;
  until done or quit;

end; { Do_Learn }


procedure Validate_File;

var
  cnt, kk, jj : integer;
  exp, act : real;
  ex, ac, di : array [1..maxC] of ptr_real;

begin
  for kk := 1 to c_size do
    begin
      New( ex[kk] );
      New( ac[kk] );
      New( di[kk] );
      ex[kk]^ := 0;
      ac[kk]^ := 0;
      di[kk]^ := 0;
    end;
  cnt := 0;

  reset( ddfile );
  repeat
    Load_Example( 'T' );
    if not eof(ddfile) then
      begin
        cnt := cnt + 1;
        if not cascade then Process_SA
        else                Cascade_Process_SA;
        for kk := 1 to c_size do
          begin
            Show_Output_File( kk, exp, act );
            ex[kk]^ := ex[kk]^ + exp;
            ac[kk]^ := ac[kk]^ + act;
            di[kk]^ := di[kk]^ + abs(act-exp);
          end;
        writeln( tfile, ';' );
        readln( ddfile );
      end;
  until eof( ddfile );
  writeln( tfile, '; Iterations: ', count:1 );
  writeln( tfile, '; Number of validation cases: ', cnt:1 );
  if cnt > 0 then
    begin
      for kk := 1 to c_size do
        begin
          ex[kk]^ := ex[kk]^ / cnt;
          ac[kk]^ := ac[kk]^ / cnt;
          di[kk]^ := di[kk]^ / cnt;
        end;
      writeln( tfile, '; Expected:' );
      for kk := 1 to c_size do
        begin
          write( tfile, ';',kk:2,' avg exp: ',ex[kk]^:4:2,' ' );
          for jj := 1 to (round((abs(ex[kk]^)/y[kk*2]^)*60)) do write( tfile, '*' );
          writeln( tfile );
        end;
      writeln( tfile, '; Actual:' );
      for kk := 1 to c_size do
        begin
          write( tfile, ';',kk:2,' avg act: ', ac[kk]^:4:2,' ' );
          for jj := 1 to (round((abs(ac[kk]^)/y[kk*2]^)*60)) do write( tfile, '*' );
          writeln( tfile );
        end;
      writeln( tfile, '; Difference:' );
      for kk := 1 to c_size do
        begin
          write( tfile, ';',kk:2,' avg dif: ', di[kk]^:4:2,' ' );
          for jj := 1 to (round((abs(di[kk]^)/y[kk*2]^)*60)) do write( tfile, '*' );
          writeln( tfile );
        end;
    end;
end; { Validate_File }


procedure Dump_Neuron_Outputs;

var
  ofile : text;
  tstr  : vstring;
  layer,
  kk    : integer;

begin
  read( dfile, layer );
  str( layer:1,tstr );
  tstr := fname + '_L' + tstr + '.DAT';
  assign( ofile, tstr );
  rewrite( ofile );

  jj := 0;
  if layer = 2 then jj := b1_size;
  if (layer = 3) and layers4 then jj := b2_size;

  for kk := 1 to jj do
    begin
      writeln( ofile, '10  ; Layer ',layer:1,', Neuron ',kk:1 );
      reset( ddfile );
      repeat
        Load_Example( 'L' );
        if not eof(ddfile) then
          begin
            if not cascade then Process_SA
            else                Cascade_Process_SA;
            if layer = 2 then writeln( ofile, b1[kk]^ );
            if layer = 3 then writeln( ofile, b2[kk]^ );
            readln( ddfile );
          end;
      until eof( ddfile );
      writeln( ofile, '10' );
      writeln( ofile, '10' );
    end;
  close( ofile );
end; { Dump_Neuron_Outputs }


procedure Input_Sensitivity_2;
{ Creates a separate file named fname_IS2.DAT which contains values for the
  outputs of the net, while all but two inputs are held constant. This allows
  us to see if there is an important relationship between any two inputs.
}

var
  ofile    : text;
  out,
  kk,jj,ll : integer;
  val,
  min, max,
  tx     : real;
  ta     : array [1..maxA] of real;

begin
  read( dfile, out );
  if out > c_size then out := c_size;
  if out < 1 then out := 1;

  for kk := 1 to (a_size-biases) do
    begin
      { Read an input value. }
      read( dfile, val );
      { First scale the input value between 0 and 1... }
      a[kk]^ := (val-x[kk*2-1]^) / (x[kk*2]^-x[kk*2-1]^);
      { ...then adjust the scale between -1 and 1 . }
      a[kk]^ := a[kk]^ * 2 - 1;
    end;
  { Save a copy of the inputs }
  for kk := 1 to a_size do ta[kk] := a[kk]^;

  assign( ofile, fname+'_IS2.DAT' );
  rewrite( ofile );

  for kk := 1 to (a_size-biases) do
    begin
      for ll := 1 to (a_size-biases) do
        begin
          max := 0;
          min := 1;
          a[kk]^ := 0; a[ll]^ := 0;
          if not cascade then Process_SA
          else                Cascade_Process_SA;
          if c[out]^ < min then min := c[out]^;
          if c[out]^ > max then max := c[out]^;

          a[kk]^ := 0; a[ll]^ := 1;
          if not cascade then Process_SA
          else                Cascade_Process_SA;
          if c[out]^ < min then min := c[out]^;
          if c[out]^ > max then max := c[out]^;

          a[kk]^ := 1; a[ll]^ := 0;
          if not cascade then Process_SA
          else                Cascade_Process_SA;
          if c[out]^ < min then min := c[out]^;
          if c[out]^ > max then max := c[out]^;

          a[kk]^ := 1; a[ll]^ := 1;
          if not cascade then Process_SA
          else                Cascade_Process_SA;
          if c[out]^ < min then min := c[out]^;
          if c[out]^ > max then max := c[out]^;

          writeln( ofile, max, ' ', min );
          { restore the correct value }
          a[ll]^ := ta[ll];
        end;
      writeln( ofile, '10 10' );
      writeln( ofile, '10 10' );
      writeln( ofile, '10 10' );
      writeln( ofile, '10 10' );
      { restore the correct value }
      a[kk]^ := ta[kk];
    end;
  close( ofile );
end; { Input_Sensitivity_2 }


procedure Input_Sensitivity_O;
{ Creates a separate file named fname_ISO.DAT which contains values for the
  outputs of the net, while all but one input is held constant. The first
  parameter defines which output we will monitor. The other parameters define
  the non-varying input values.
}

var
  ofile  : text;
  out,
  kk,jj  : integer;
  val,
  tx     : real;
  ta     : array [1..maxA] of real;

begin
  read( dfile, out );
  if out > c_size then out := c_size;
  if out < 1 then out := 1;

  for kk := 1 to (a_size-biases) do
    begin
      read( dfile, val );
      a[kk]^ := (val-x[kk*2-1]^) / (x[kk*2]^-x[kk*2-1]^);
      a[kk]^ := a[kk]^ * 2 - 1;
    end;
  for kk := 1 to a_size do ta[kk] := a[kk]^;

  assign( ofile, fname+'_ISO.DAT' );
  rewrite( ofile );

  for kk := 1 to (a_size-biases) do
    begin
      tx := -1.0;
      repeat
        a[kk]^ := tx;
        if not cascade then Process_SA
        else                Cascade_Process_SA;
        writeln( ofile, c[out]^ );
        tx := tx + 0.2;
      until tx > 1.0;
      a[kk]^ := ta[kk];
      writeln( ofile, ' 10' );
      writeln( ofile, ' 10' );
    end;
  close( ofile );
end; { Input_Sensitivity_O }


procedure Input_Sensitivity_S;
{ Creates a separate file named fname_ISS.DAT which contains values for the
  outputs of the net, while all but one input is held constant. The parameters
  define the non-varying input values.
}

var
  ofile  : text;
  kk,jj  : integer;
  val, avg,
  tx     : real;
  ta     : array [1..maxA] of real;

begin
  for kk := 1 to (a_size-biases) do
    begin
      read( dfile, val );
      a[kk]^ := (val-x[kk*2-1]^) / (x[kk*2]^-x[kk*2-1]^);
      a[kk]^ := a[kk]^ * 2 - 1;
    end;
  for kk := 1 to a_size do ta[kk] := a[kk]^;

  assign( ofile, fname+'_ISO.DAT' );
  rewrite( ofile );

  for kk := 1 to (a_size-biases) do
    begin
      tx := -1.0;
      repeat
        a[kk]^ := tx;
        if not cascade then Process_SA
        else                Cascade_Process_SA;
        avg := 0;
        for jj := 1 to c_size do avg := avg + c[jj]^;
        avg := avg / c_size;
        writeln( ofile, avg );
        tx := tx + 0.2;
      until tx > 1.0;
      a[kk]^ := ta[kk];
      writeln( ofile, ' 10' );
      writeln( ofile, ' 10' );
    end;
  close( ofile );
end; { Input_Sensitivity_S }


procedure Learned_Worst_File;

const
  max_cases = 700;

var
  x,ww,kk,jj,ll : integer;
  e, OE      : real;
  ch         : char;
  d, tstr    : string[25];
  ex         : array [1..max_cases] of integer;
  des        : array [1..max_cases] of string[25];
  err        : array [1..max_cases] of real;
  quit, done : boolean;

begin
  read( dfile, ww );
  reset( ddfile );
  jj := 0;
  quit := false;
  repeat
    Load_Example( 'L' );
    jj := jj + 1;
    if jj = max_cases then quit := true;
    if not eof(ddfile) then readln( ddfile, tstr );
    if not cascade then Process_SA
    else                Cascade_Process_SA;
    OE := 0;
    for kk := 1 to c_size do
      OE := OE + (sqr( z[kk]^ - c[kk]^ ) );
    ex[jj] := jj;
    err[jj] := OE;
    des[jj] := tstr;
  until eof(ddfile) or quit;
  if quit then
    writeln( tfile,'*** Warning: not all cases were read (limit=',max_cases:1,')' );

  repeat
    done := true;
    for kk := 1 to jj-1 do
      if err[kk] < err[kk+1] then
        begin
          e         := err[kk];   x        := ex[kk];   d         := des[kk];
          err[kk]   := err[kk+1]; ex[kk]   := ex[kk+1]; des[kk]   := des[kk+1];
          err[kk+1] := e;         ex[kk+1] := x;        des[kk+1] := d;
          done := false;
        end;
  until done;

  writeln( tfile, '; Learning errors:' );
  writeln( tfile, '; Case  Error      Description' );
  if (ww > jj) or (ww < 0) then ww := jj;
  for kk := 1 to ww do
   writeln( tfile, '; ',ex[kk]:1,' ',err[kk],' ',des[kk] );
end; { Learned_Worst_File }


procedure Load_Connections;

var
  l1, l2,
  i, kk, jj: integer;
  link     : real;

begin
  read( dfile, l1, kk, l2, jj, link );
  if (l1 = 1) and (l2 = 2) then
    begin
      i := ( (jj-1) * a_size ) + kk;
      b1d[i]^ := link;
    end;
  if (not layers4) and (l1 = 2) and (l2 = 3) then
    begin
      i := ( (jj-1) * b1_size ) + kk;
      cd[i]^ := link;
    end;
  if layers4 then
    begin
      if (l1 = 1) and (l2 = 3) then
        begin
          i := ( (jj-1) * a_size ) + kk;
          b2da[i]^ := link;
        end;
      if (l1 = 2) and (l2 = 3) then
        begin
          i := ( (jj-1) * b1_size ) + kk;
          b2d[i]^ := link;
        end;
      if (l1 = 2) and (l2 = 4) then
        begin
          i := ( (jj-1) * b1_size ) + kk;
          cdb1[i]^ := link;
        end;
      if (l1 = 3) and (l2 = 4) then
        begin
          i := ( (jj-1) * b2_size ) + kk;
          cd[i]^ := link;
        end;
    end;
end; { Load_Connections }


procedure Dump_Connections;

var
  i, b, kk, jj : integer;

begin
  writeln( tfile, '; Connection values:' );
  b := b1_size;
  if cascade then
    begin
      b := noof_casc;
      writeln( tfile, 'CA ', noof_casc:1 );
    end;
  for kk := 1 to a_size do
    for jj := 1 to b do
      begin
        { Calculate the index of the link. }
        i := ( (jj-1) * a_size ) + kk;
        writeln( tfile, 'CV 1 ', kk:1, ' 2 ', jj:1, ' ', b1d[i]^ );
      end;

  if not layers4 then
    for kk := 1 to b do
      for jj := 1 to c_size do
        begin
          { Calculate the index of the link. }
          i := ( (jj-1) * b ) + kk;
          writeln( tfile, 'CV 2 ', kk:1, ' 3 ', jj:1, ' ', cd[i]^ );
        end;

  if layers4 then
    begin
      for kk := 1 to a_size do
        for jj := 1 to b2_size do
          begin
            { Calculate the index of the link. }
            i := ( (jj-1) * a_size ) + kk;
            writeln( tfile, 'CV 1 ', kk:1, ' 3 ', jj:1, ' ', b2da[i]^ );
          end;
      for kk := 1 to b1_size do
        begin
          for jj := 1 to b2_size do
            begin
              { Calculate the index of the link. }
              i := ( (jj-1) * b1_size ) + kk;
              writeln( tfile, 'CV 2 ', kk:1, ' 3 ', jj:1, ' ', b2d[i]^ );
            end;
          for jj := 1 to c_size do
            begin
              { Calculate the index of the link. }
              i := ( (jj-1) * b1_size ) + kk;
              writeln( tfile, 'CV 2 ', kk:1, ' 4 ', jj:1, ' ', cdb1[i]^ );
            end;
        end;
      for kk := 1 to b2_size do
        for jj := 1 to c_size do
          begin
            { Calculate the index of the link. }
            i := ( (jj-1) * b2_size ) + kk;
            writeln( tfile, 'CV 3 ', kk:1, ' 4 ', jj:1, ' ', cd[i]^ );
          end;
    end;

end; { Dump_Connections }


procedure Dump_Neuron_Data( ch: char );
{ Dump the values of all the links between the inputs and the 1st hidden
  layer, grouped together by neuron. Write a few dummy values after each
  neuron, so that we can tell them apart when we plot the data.
}

var
  i,
  kk, jj : integer;
  val    : real;

begin
  writeln( tfile, '; Links from the inputs to the 1st hidden layer:' );
  for jj := 1 to b1_size do
    begin
      for kk := 1 to a_size do
        begin
          { Calculate the index of the link. }
          i := ( (jj-1) * a_size ) + kk;
          val := b1d[i]^;
          if ch = 'M' then { do a moving average }
            begin
              if (i > 2) and (i < (a_size-1)) then
                val := (b1d[i-2]^ + b1d[i-1]^ + b1d[i]^ + b1d[i+1]^ +
                  b1d[i+2]^)/5
              else
                begin
                  if i < 3 then
                    val := (b1d[i]^ + b1d[i+1]^)/2;
                  if i > (a_size-2) then
                    val := (b1d[i-1]^ + b1d[i]^)/2;
                end;
            end;
          writeln( tfile, '; ', kk:1, ' ', jj:1, ' ', val );
        end;
      { Write some dummy values between the neurons: }
      writeln( tfile, '; 0 0 -10' );
      writeln( tfile, '; 0 0 -10' );
      writeln( tfile, '; 0 0 -10' );
      writeln( tfile, '; 0 0 -10' );
    end;

end; { Dump_Neuron_Data }


procedure Auto_Learn( ll: integer );
{ Does the standard learning process, but automatically sets some of the
  parameters.
}

var
  quit       : boolean;
  local_count: integer;
  avg,
  e25, e100  : real;
  history    : array [1..100] of real;

begin
  local_count := 0;
  if ll < 10 then ll := 10;
  ll := round(ll / 10);
  if ll > 99 then ll := 99;
  auto_momentum := true;
  quit := false;
  Do_Learn(25, quit );
  e25 := avgE;
  if not quit then Do_Learn(75, quit );
  e100 := avgE;
  M := 0.75;
  auto_momentum := false;
  for kk := 1 to 100 do history[kk] := avgE;
  repeat
    if not quit then Do_Learn(10, quit );
    local_count := local_count + 10;
    for kk := 100 downto 2 do history[kk] := history[kk-1];
    history[1] := avgE;
    { If there's some oscillation, then reduce the learning rate. }
    avg := 0.0;
    for kk := 2 to 6 do avg := avg + history[kk];
    avg := avg / 5;
    if history[1] > avg then
      begin
        U := U * 0.98;
        M := M * 0.98;
        write( tfile, ';>' );
      end;
    if (count mod 50) < 2 then
      begin
        avg := 0.0;
        for kk := 2 to (ll+1) do avg := avg + history[kk];
        avg := avg / ll;
{
        writeln( 'Error flatness: ', (history[1]/avg):6:4 );
        writeln( 'Temperature: ', (U*M):6:4 );
}
      end;
    if local_count > (ll*10) then
      begin
        avg := 0.0;
        for kk := 2 to (ll+1) do avg := avg + history[kk];
        avg := avg / ll;
        if ((history[1] / avg) > 0.99) and
           ((history[1] / avg) <= 1.0) and
           (history[1] <= history[2]) then
          begin
            quit := true;
            write( tfile, ';No significant progress for the last ',ll*10:1 );
            writeln( tfile, ' iterations.' );
          end;
      end;
    if count > max_iter then quit := true;
  until quit;
  writeln( tfile, '; Auto-Learn Final avg error: ', avgE:7:5, ', Epoch: ',
    count:1 );
end; { Auto_Learn }


procedure Cascade_Auto_Learn( ll: integer );

var
  quit       : boolean;
  local_count: integer;
  avg        : real;
  history    : array [1..100] of real;

begin
  local_count := 0;
  if ll < 10 then ll := 10;
  ll := round(ll / 10);
  if ll > 99 then ll := 99;
  quit := false;
  for kk := 1 to 100 do history[kk] := 1.0;
  repeat
    if not quit then Do_Learn( 10, quit );
    local_count := local_count + 10;
    for kk := 100 downto 2 do history[kk] := history[kk-1];
    history[1] := avgE;

    { If there's some oscillation, then reduce the learning rate. }
{
    avg := 0.0;
    for kk := 2 to 10 do avg := avg + history[kk];
    avg := avg / 9;
    if (count mod 20) < 1 then
      if history[1] > avg then
        begin
          U := U * 0.98;
          M := M * 0.98;
          write( tfile, ';>' );
        end;
}
    if (count mod 50) < 1 then
      begin
        avg := 0.0;
        for kk := 2 to (ll+1) do avg := avg + history[kk];
        avg := avg / ll;
{
        writeln( 'Error flatness: ', (history[1]/avg):6:4 );
        writeln( 'Temperature: ', (U*M):6:4 );
}
      end;
    if local_count >= (ll*10) then
      begin
        avg := 0.0;
        for kk := 2 to (ll+1) do avg := avg + history[kk];
        avg := avg / ll;
        if ((history[1] / avg) > 0.99) and
           ((history[1] / avg) < 1.01) then
          begin
            quit := true;
            write( tfile, ';No significant progress for the last ',ll*10:1 );
            writeln( tfile, ' iterations.' );
          end;
      end;
    if count > max_iter then quit := true;
  until quit;
  writeln( tfile, '; Cascade: ',noof_casc:1,', Final avg error: ', avgE:7:5,
    ', Epoch: ', count:1 );
end; { Cascade_Auto_Learn }


procedure Anneal;
{ Continues the learning process, but reduces the learn rate and momentum
  every 10 iterations.
}

var
  quit      : boolean;
  ll        : integer;

begin
  read( dfile, ll );
  if ll > 1000 then ll := 1000;
  if ll < 1 then ll := 1;
  auto_momentum := false;
  writeln( tfile, ';Beginning annealing.' );
  for kk := 1 to (1+round(ll/10)) do
    begin
      U := U * 0.95;
      M := M * 0.95;
      if not quit then Do_Learn( 10, quit );
    end;
  writeln( tfile, ';Annealing complete.' );
  writeln( tfile, '; Annealed final avg error: ', avgE:7:5,', Epoch: ',count:1);
end; { Anneal }


procedure Command_Script;

var
  kk,jj,ll : integer;
  oU, oM : real;
  done : boolean;

begin
  oU := U;
  oM := M;
  reset( dfile );
  kk := 1;
  jj := 1;
  repeat
    read( dfile, s2 );
    if s2 = 'AL' then
      begin
        read( dfile, ll, graph_max, graph_min );
        plot.set_y_scale( graph_min, graph_max );
        done := false;
        if not cascade then Auto_Learn(ll)
        else
          repeat
            writeln( tfile, '; Cascades: ',noof_casc:1 );
            U := oU;
            M := oM;
            Cascade_Auto_Learn(ll);
            if (noof_casc = b1_size) or (avgE <= tolerance) or
              (count > max_iter) then done := true;
            if not done then noof_casc := noof_casc + 1;
          until done;
      end;
    if s2 = 'DM' then Dump_Connections;
    if s2 = 'DF' then Dump_Neuron_Data( 'N' );
    if s2 = 'DL' then Dump_Neuron_Data( 'M' );
    if s2 = 'NF' then Dump_Neuron_Outputs;
    if s2 = 'IO' then Input_Sensitivity_O;
    if s2 = 'IS' then Input_Sensitivity_S;
    if s2 = 'I2' then Input_Sensitivity_2;
    if s2 = 'WC' then Learned_Worst_File;
    if s2 = 'RN' then Random_Net;
    if s2 = 'SA' then Anneal;
    if s2 = 'XR' then
      begin
        read( dfile, x[kk]^, x[kk+1]^ );
        kk := kk + 2;
      end;
    if s2 = 'YR' then
      begin
        read( dfile, y[jj]^, y[jj+1]^ );
        jj := jj + 2;
      end;
    if s2 = 'IC' then
      begin
        read( dfile, max_iter, lfreq );
        if max_iter < 1 then max_iter := 1;
        if lfreq < 1 then lfreq := 100;
      end;
    if s2 = 'PL' then
      begin
        read( dfile, tolerance, graph_max, graph_min );
        plot.set_y_scale( graph_min, graph_max );
        done := false;
        if not cascade then Do_Learn( max_iter, done );
      end;
    if s2 = 'PP' then
      begin
        read( dfile, U, M, G );
        oU := U;
        oM := M;
        writeln( tfile, 'RN 9' );
        writeln( tfile, 'IC 0 0 ; Don`t want to learn anything, ',
          'just set the paramters' );
        writeln(tfile,'PP ',U:4:2,' ',M:4:2,' ',G:4:2);
        auto_momentum := false;
        if M >= 1.0 then
          begin
            auto_momentum := true;
            M := 0.75;
          end;
      end;
    if s2 = 'CV' then Load_Connections;
    if s2 = 'VA' then Validate_File;
    readln( dfile );
  until eof( dfile );
  plot.label_lower_middle( 'Press any key         ' );
  ch := ReadKey;

end; { Command_Script }


procedure Evaluate_Cases( var noof_in, noof_t: integer );
{ Count the number of Learn and Test cases, set the in/out ranges, and
  log the distributions.
}

var
  cntl, cntt,
  kk, jj   : integer;
  lrn, val : array [1..maxC] of ptr_real;


procedure Set_Ranges( noof_in: integer );
{ Determine the input and output ranges by checking the Learn data.
}

var
  jj,kk : integer;

procedure Load_L_Range;
{ Get the next L example from the input file, and load the data into
  the input and output arrays.
}
var
  kk  : integer;
  val : real;
begin
  repeat
    if not eof(ddfile) then read( ddfile, ch );
    if (ch <> 'L') and (not eof(ddfile)) then readln( ddfile );
  until (ch = 'L') or eof(ddfile);

  if not eof(ddfile) then
    begin
      for kk := 1 to (a_size-biases) do
        begin
          read( ddfile, val );
          if val < x[kk*2-1]^ then x[kk*2-1]^ := val;
          if val > x[kk*2]^   then x[kk*2]^   := val;
          xm[kk] := xm[kk] + val;
        end;
      for kk := 1 to c_size do
        begin
          read( ddfile, val );
          if val < y[kk*2-1]^ then y[kk*2-1]^ := val;
          if val > y[kk*2]^   then y[kk*2]^   := val;
          ym[kk] := ym[kk] + val;
        end;
    end;
end; { Load_L_Range }

procedure Load_SD;
{ Compute Standard Deviations for the inputs and outputs.
}
var
  kk  : integer;
  val : real;
begin
  repeat
    if not eof(ddfile) then read( ddfile, ch );
    if (ch <> 'L') and (not eof(ddfile)) then readln( ddfile );
  until (ch = 'L') or eof(ddfile);

  if not eof(ddfile) then
    begin
      for kk := 1 to (a_size-biases) do
        begin
          read( ddfile, val );
          xsd[kk] := xsd[kk] + (sqr(val-xm[kk]) / (noof_in-1));
        end;
      for kk := 1 to c_size do
        begin
          read( ddfile, val );
          ysd[kk] := ysd[kk] + (sqr(val-ym[kk]) / (noof_in-1));
        end;
    end;
end; { Load_SD }

begin { Set_Ranges }
  for kk := 1 to maxA do xm[kk] := 0;
  for kk := 1 to maxC do ym[kk] := 0;
  for kk := 1 to (a_size-biases) do
    begin
      x[kk*2-1]^ := maxint;
      x[kk*2]^   := -maxint;
    end;
  for kk := 1 to c_size do
    begin
      y[kk*2-1]^ := maxint;
      y[kk*2]^   := -maxint;
    end;

  reset( ddfile );
  repeat
    Load_L_Range;
  until eof(ddfile);

  for kk := 1 to (a_size-biases) do
    if x[kk*2-1]^ = x[kk*2]^ then
      x[kk*2]^ := x[kk*2]^ + 0.0001;
  for kk := 1 to c_size do
    if y[kk*2-1]^ = y[kk*2]^ then
      y[kk*2]^ := y[kk*2]^ + 0.0001;

  { Compute means for the ins and outs. }
  if noof_in > 0 then
    begin
      for kk := 1 to maxA do xm[kk] := xm[kk] / noof_in;
      for kk := 1 to maxC do ym[kk] := ym[kk] / noof_in;
    end;

  { Compute Standard Deviations for the ins and outs. }
  for kk := 1 to (a_size-biases) do xsd[kk] := 0;
  for kk := 1 to c_size do ysd[kk] := 0;
  reset( ddfile );
  repeat
    Load_SD;
  until eof(ddfile);
  for kk := 1 to (a_size-biases) do xsd[kk] := sqrt( xsd[kk] );
  for kk := 1 to c_size do ysd[kk] := sqrt( ysd[kk] );
end; { Set_Ranges }


begin { Evaluate_Cases }
  for kk := 1 to c_size do
    begin
      New( lrn[kk] );
      New( val[kk] );
      lrn[kk]^ := 0;
      val[kk]^ := 0;
    end;

  noof_in := 0;
  noof_t  := 0;
  reset( ddfile );
  repeat
    readln( ddfile, ch );
    case ch of
      'L': noof_in := noof_in + 1;
      'T': noof_t  := noof_t + 1;
      else;
    end;
  until eof( ddfile );

  { Set the scaling factors for each input and output. }
  Set_Ranges( noof_in );

  cntl := 0;
  reset( ddfile );
  repeat
    Load_Example( 'L' );
    if not eof(ddfile) then
      begin
        cntl := cntl + 1;
        for kk := 1 to c_size do
          begin
            jj := (kk-1) * 2 + 1;
            lrn[kk]^ := lrn[kk]^ + y[jj+1]^*z[kk]^ - y[jj]^*z[kk]^ + y[jj]^;
          end;
      end;

  until eof( ddfile );
  cntt := 0;
  reset( ddfile );
  repeat
    Load_Example( 'T' );
    if not eof(ddfile) then
      begin
        cntt := cntt + 1;
        for kk := 1 to c_size do
          begin
            jj := (kk-1) * 2 + 1;
            val[kk]^ := val[kk]^ + y[jj+1]^*z[kk]^ - y[jj]^*z[kk]^ + y[jj]^;
          end;
      end;
  until eof( ddfile );

  if noof_in > 0 then
    for kk := 1 to c_size do
      lrn[kk]^ := lrn[kk]^ / noof_in;
  if noof_t > 0 then
    for kk := 1 to c_size do
      val[kk]^ := val[kk]^ / noof_t;

  writeln( 'Learn cases : ',noof_in:1 );
  writeln( 'Test  cases : ',noof_t:1 );
  writeln( tfile, ';' );
  writeln( tfile, '; Distribution of ',noof_in:1,' Learn cases:' );
  for kk := 1 to c_size do
    begin
      write( tfile, ';',kk:2,' avg: ',lrn[kk]^:4:2,' ' );
      for jj := 1 to (round((abs(lrn[kk]^)/y[kk*2]^)*60)) do write( tfile, '*' );
      writeln( tfile );
    end;
  writeln( tfile, ';' );
  writeln( tfile, '; Distribution of ',noof_t:1,' Test cases:' );
  for kk := 1 to c_size do
    begin
      write( tfile, ';',kk:2,' avg: ',val[kk]^:4:2,' ' );
      for jj := 1 to (round((abs(val[kk]^)/y[kk*2]^)*60)) do write( tfile, '*' );
      writeln( tfile );
    end;
end; { Evaluate_Cases }


begin { PNN }
  Init_Graph_Mode( 'SETUP.DAT' );
  writeln;
  write( 'File name (no extension, .DAT assumed) : ' );
  readln( fname );

  assign( tfile, fname+'_LOG.DAT' );
  rewrite( tfile );

  assign( dfile, fname+'.DAT' );
  assign( ddfile, fname+'.DAT' );
  reset( dfile );
  G := 1.0;
  U := 0.8;
  M := 0.75;
  tolerance := 0.00001;
  sumE := 0.0;
  maxE := 0.0;
  avgE := 10.0;
  biases := 0;
  cascade := false;
  noof_casc := 1;
  worst_error := 0.0;

  repeat
    read( dfile, s2 );
    if s2 = 'SN' then
      begin
        read( dfile, kk, a_size );
        if (kk < 3) or (kk > 4) then
          begin
            writeln( 'Invalid number of layers.' );
            halt;
          end;
        b2_size := 0;
        layers4 := false;
        if kk = 3 then read( dfile, b1_size, c_size );
        if kk = 4 then
          begin
            read( dfile, b1_size, b2_size, c_size );
            layers4 := true;
          end;
      end;
    if s2 = 'SC' then
      begin
        cascade := true;
        read( dfile, kk, a_size, b1_size, c_size );
        if kk <> 3 then
          begin
            writeln( 'Invalid number of layers - must be 3 for cascade mode.' );
            halt;
          end;
        b2_size := 0;
        layers4 := false;
      end;
    if s2 = 'SB' then read( dfile, biases );
    if s2 = 'CA' then read( dfile, noof_casc );
    readln( dfile );
  until eof( dfile );
  if cascade then biases := b1_size;
  a_size := a_size + biases;
  b1d_size := a_size * b1_size;
  b2d_size := b1_size * b2_size;
  b2da_size := a_size * b2_size;
  cdb1_size := b1_size * c_size;

  if not layers4 then
    begin
      cd_size := b1_size * c_size;
      if not cascade then
        writeln( tfile, 'SN 3 ', (a_size-biases):1,' ',b1_size:1,' ',c_size:1 )
      else
        writeln( tfile, 'SC 3 ', (a_size-biases):1,' ',b1_size:1,' ',c_size:1 );
      if (biases > 0) and (not cascade) then writeln( tfile, 'SB ',biases:1 );
    end
  else
    begin
      cd_size := b2_size * c_size;
      writeln( tfile, 'SN 4 ',(a_size-biases):1,' ',b1_size:1,' ',
        b2_size:1,' ',c_size:1 );
      if biases > 0 then writeln( tfile, 'SB ',biases:1 );
    end;

  Allocate_Heap;
  if biases > 0 then
    for kk := (a_size-biases+1) to a_size do a[kk]^ := 1.0;
  Evaluate_Cases( noof_in, noof_t );

  reset( dfile );
  kk := 1;
  jj := 1;
  repeat
    read( dfile, s2 );
    if s2 = 'XR' then
      begin
        read( dfile, x[kk]^, x[kk+1]^ );
        kk := kk + 2;
      end;
    if s2 = 'YR' then
      begin
        read( dfile, y[jj]^, y[jj+1]^ );
        jj := jj + 2;
      end;
    readln( dfile );
  until eof( dfile );

  for kk := 1 to (a_size-biases) do
    begin
      writeln( tfile, 'XR ', x[kk*2-1]^, ' ', x[kk*2]^ );
      writeln( tfile, ';    mean ',xm[kk],'  SD ',xsd[kk],
        ' +3sig ',(xm[kk]+3*xsd[kk]) );
    end;
  for kk := 1 to c_size do
    begin
      writeln( tfile, 'YR ', y[kk*2-1]^, ' ', y[kk*2]^ );
      writeln( tfile, ';    mean ',ym[kk],'  SD ',ysd[kk],
        ' +3sig ',(ym[kk]+3*ysd[kk]) );
    end;

  count := 0;
  lfreq := 10;
  writeln( 'Results will be written to file ',fname,'_LOG.DAT .' );
  writeln( 'Press any key to quit training.' );
  writeln;
  write( 'Now press any key to begin training ' );
  ch := ReadKey;

  if video_mode >= EGA then
    begin
      color := initial_color;
      worst_color := initial_color;
    end
  else color := white;
  plot.init_full_screen;
  plot.set_x_scale( 0, GetMaxX );
  graph_min := 0.0001;
  graph_max := 0.01;
  plot.set_y_scale( graph_min, graph_max );
  plot.set_color( white );

  Command_Script;

  Beep; Beep;
  plot.disable;
  close( ddfile );
  close( tfile );

end. { PNN }
