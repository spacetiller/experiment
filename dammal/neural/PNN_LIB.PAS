
{ pnn_LIB.PAS }
unit PNN_Lib;
interface
uses
  Dos,
  CRT,
  Graph;
const
  max_string     = 80;
  printer_device = 'PRN';

type
  string3         = packed array [1..3] of char;
  string4         = packed array [1..4] of char;
  string5         = packed array [1..5] of char;
  string10        = packed array [1..10] of char;
  vstring3        = string[3];
  vstring5        = string[5];
  vstring10       = string[10];
  vstring15       = string[15];
  vstring25       = string[25];
  vstring80       = string[80];
  vstring255      = string[255];
  vstring         = string[max_string];
  on_or_off       = ( on, off );
  symtype         = ( nulsym, numsym, strsym );
  location = object
    Xpos, Ypos : integer;
    procedure init( initX, initY: integer );
    function get_X: integer;
    function get_Y: integer;
  end;
  apoint = object(location)
    visible     : boolean;
    point_color : word;
    procedure init( initX, initY: integer );
    procedure show;
    procedure hide;
    procedure set_color( c: word );
    function  get_point_color: word;
    function  isvisible: boolean;
    procedure move_to( newX, newY: integer );
    procedure add( newX, newY: integer );
  end;
  aplot = object(apoint)
    minX, maxX,
    minY, maxY : real;
    view : ViewPortType;
    tstr : string;
    procedure gwrite( tst: vstring80 );
    procedure gwriteln( tst: vstring80 );
    procedure init_full_screen;
    procedure set_x_scale( min, max: real );
    procedure set_y_scale( min, max: real );
    procedure val( rX, rY: real );
    procedure plus( rX, rY: real );
    procedure label_here( strn: string );
    procedure labelXY( strn: string; rX, rY: real );
    procedure label_upper_left( strn: string );
    procedure label_lower_left( strn: string );
    procedure label_lower_middle( strn: string );
    procedure label_lower_right( strn: string );
    procedure disable;
  end;

var
  printer     : text;
  ch          : char;
  strn        : vstring80;
  num,kk,jj,
  status      : integer;
  realnum     : real;
  crt_output,
  graphics_on,
  done        : boolean;
  sym         : symtype;
  point       : apoint;
  plot        : aplot;
  video_mode,
  noof_rows,
  char_size,
  nch, xx,yy,
  xbyte       : integer;
  finished,
  screen      : boolean;

procedure check_IO;
function Read_Char: char;
function answer_yes : boolean;
procedure pause;
procedure beep;
procedure rvson;
procedure rvsoff;
procedure clear_rest( line: integer );
procedure remove_spaces( var strn: vstring255 );
procedure Get_User_Input( var strn: vstring80; var sym: symtype;
  var num: integer; var realnum: real );
procedure Get_Sentence( var strn: vstring80; var len: integer );
procedure Init_Graph_Mode( fname: vstring );
procedure clear_error23;
procedure info_line23( line: vstring );
procedure show_error23( estring: vstring );
procedure abort( S: String );
procedure backup_one_space;


implementation

procedure location.init( initX, initY: integer );
begin
  Xpos := initX;
  Ypos := initY;
end;

function location.get_X: integer;
begin get_X := Xpos; end;
function location.get_Y: integer;
begin get_Y := Ypos; end;

procedure apoint.init( initX, initY: integer );
begin
  location.init( initX, initY );
  visible := false;
end;

procedure apoint.show;
begin
  visible := true;
  PutPixel( Xpos, Ypos, point_color );
end;

procedure apoint.hide;
begin
  visible := false;
  PutPixel( Xpos, Ypos, GetBkColor );
end;

procedure apoint.set_color( c: word );
begin
  point_color := c;
  if (video_mode = CGA) and (c > Black) then point_color := White;
  SetColor( point_color );
end;

function apoint.isvisible: boolean;
begin isvisible := visible; end;

function apoint.get_point_color: word;
begin get_point_color := point_color; end;

procedure apoint.move_to( newX, newY: integer );
begin
  hide;
  Xpos := newX;
  Ypos := newY;
  apoint.show;
end;

procedure apoint.add( newX, newY: integer );
begin
  Xpos := newX;
  Ypos := newY;
  apoint.show;
end;


procedure aplot.gwrite( tst: vstring80 );
begin OutText( tst ); end;
procedure aplot.gwriteln( tst: vstring80 );
begin
  OutText( tst );
  Ypos := GetY;
  Inc( Ypos, TextHeight('H') + 1 );
  Xpos := 0;
  moveto( Xpos,Ypos );
end;

procedure aplot.init_full_screen;
begin
  screen := true;
  SetGraphMode( GetGraphMode );
  SetColor( apoint.get_point_color );
  SetViewPort( 0,0,GetMaxX,GetMaxY, ClipOn );
  maxX := GetMaxX;
  maxY := GetMaxY;
  minX := 0;
  minY := 0;
  graphics_on := true;
end;

procedure aplot.set_x_scale( min, max: real );
begin
  minX := min;
  maxX := max;
end;

procedure aplot.set_y_scale( min, max: real );
begin
  minY := min;
  maxY := max;
end;

procedure aplot.val( rX, rY: real );
begin
  Xpos := round( ((rX-minX)/(maxX-minX)) * GetMaxX );
  Ypos := GetMaxY - round( ((rY-minY)/(maxY-minY)) * GetMaxY );
  apoint.show;
end;

procedure aplot.plus( rX, rY: real );
var xx, yy: integer;
begin
  val( rX,   rY );
  xx := Xpos;
  yy := Ypos;
  add( xx+1, yy );
  add( xx+2, yy );
  add( xx-1, yy );
  add( xx-2, yy );
  add( xx,   yy+1 );
  add( xx,   yy+2 );
  add( xx,   yy-1 );
  add( xx,   yy-2 );
end;

procedure aplot.label_here( strn: string );
begin
  OutText( strn );
end;
procedure aplot.labelXY( strn: string; rX, rY: real );
begin
  Xpos := round( ((rX-minX)/(maxX-minX)) * GetMaxX );
  Ypos := GetMaxY - round( ((rY-minY)/(maxY-minY)) * GetMaxY );
  OutTextXY( Xpos,Ypos, strn );
end;
procedure aplot.label_upper_left( strn: string );
begin
  GetViewSettings( view );
  SetViewPort( 0,0, TextWidth(strn),TextHeight(strn), ClipOn );
  ClearViewPort;
  OutTextXY( 0,0, strn );
  with view do
    SetViewPort( x1,y1,x2,y2,Clip );
end;
procedure aplot.label_lower_left( strn: string );
begin
  GetViewSettings( view );
  SetViewPort( 0,GetMaxY-TextHeight(strn), TextWidth(strn),GetMaxY, ClipOn );
  ClearViewPort;
  OutTextXY( 0,0, strn );
  with view do
    SetViewPort( x1,y1,x2,y2,Clip );
end;
procedure aplot.label_lower_middle( strn: string );
begin
  GetViewSettings( view );
  SetViewPort( (GetMaxX div 2),GetMaxY-TextHeight(strn),
    TextWidth(strn) + (GetMaxX div 2),GetMaxY, ClipOn );
  ClearViewPort;
  OutTextXY( 0,0, strn );
  with view do
    SetViewPort( x1,y1,x2,y2,Clip );
end;
procedure aplot.label_lower_right( strn: string );
begin
  GetViewSettings( view );
  SetViewPort( GetMaxX-TextWidth(strn),GetMaxY-TextHeight(strn),
    GetMaxX, GetMaxY, ClipOn );
  ClearViewPort;
  OutTextXY( 0,0, strn );
  with view do
    SetViewPort( x1,y1,x2,y2,Clip );
end;

procedure aplot.disable;
begin
  RestoreCRTMode;
  graphics_on := false;
end;



procedure Init_Graph_Mode( fname: vstring );
var
  gr, gd, gm : integer;
  ch : char;
  ff : text;
  dir_info : SearchRec;
begin
  FindFirst( fname, AnyFile, dir_info );
  if DosError = 0 then
    begin
      assign( ff, fname );
      reset( ff );
      read( ff, ch );
      video_mode := CGA;
      if ch in ['V','v','E','e'] then video_mode := VGA;
      close( ff );
    end
  else video_mode := CGA;

  char_size := 30;
  gd := Detect;
  InitGraph( gd, gm, '' );
  gr := GraphResult;
  if gr <> grOK then
    begin
      video_mode := 0;
      writeln( 'No Graphics' );
      Delay(5000);
    end
  else
    begin
      plot.set_color( White );
      plot.set_x_scale( 0,GetMaxX );
      plot.set_y_scale( GetMaxY,0 );
      RestoreCRTMode;
    end;
  graphics_on := false;
end; { Init_Graph_Mode }


procedure check_IO;

var
  kk : integer;

begin
  kk := IOResult;
  if kk <> 0 then
    begin
      beep;
      writeln;
      writeln( 'An I/O error #',kk:1,' has occurred:' );
      writeln;
      case IOResult of
       0: ;
       2: write( 'File not found' );
       3: write( 'Path (directory) not found' );
       4: write( 'Too many open files' );
       5: write( 'File access denied' );
       100: write( 'Disk read error - read past end of file' );
       101: write( 'Disk write error - disk full' );
       150: write( 'Disk is write-protected' );
       152: write( 'Drive not ready' );
       else;
      end;
      writeln;
      halt;
    end;
end; { check_IO }


function Read_Char: char;
var
  ch : char;
begin
  ch := UpCase( ReadKey );
  writeln( ch );
  Read_Char := ch;
end;

function answer_yes : boolean;
var
  response : char;
begin
  repeat
    response := UpCase( ReadKey );
    if not (response in ['Y','N']) then write(^G);
  until response in ['Y','N'];
  answer_yes := (response = 'Y');
  writeln;
end;

procedure pause;
var
  ch : char;
begin
  writeln;
  write( 'Press any key to continue ...' );
  ch := ReadKey;
end;

procedure beep;
begin
  Sound(600);
  Delay(200);
  NoSound;
end;

procedure rvson;
begin
  TextBackground(7);
  TextColor(0);
end;

procedure rvsoff;
begin
  NormVideo;
end;

procedure clear_rest( line: integer );
var kk : integer;
begin
  for kk := line to 24 do
    begin
      GotoXY( 1,kk );
      ClrEol;
    end;
  GotoXY( 1,line );
end;

procedure clear_error23;
var
  X,Y : integer;
begin
  X := WhereX;
  Y := WhereY;
  GotoXY( 1,23 );
  ClrEol;
  GotoXY( X,Y );
end;

procedure info_line23( line: vstring );
{ 0 }
var
  X, Y : integer;
begin
  X := WhereX;
  Y := WhereY;
  GotoXY( 1,23 );
  ClrEol;
  rvson;
  write( line );
  rvsoff;
  GotoXY( X,Y );
end; { info_line23 }

procedure show_error23( estring: vstring );
{ 0 }
var
  X, Y : integer;
  ch   : char;
begin
  info_line23( estring );
  beep;
  X := WhereX;
  Y := WhereY;
  GotoXY( 1,24 );
  ClrEol;
  rvson;
  write( 'Press any key to continue... ' );
  ch := ReadKey;
  rvsoff;
  GotoXY( 1,24 );
  ClrEol;
  GotoXY( X,Y );
end; { show_error23 }

procedure abort( S: String );
{ 0 }
begin
  beep;
  GotoXY(1, 24);
  ClrEol;
  write( S, ' terminating execution' );
  Halt;
end;

procedure backup_one_space;
var
  X,Y : integer;
begin
  X := WhereX;
  Y := WhereY;
  GotoXY( X-1,Y );
end;

procedure remove_spaces( var strn: vstring255 );
{ 0 }
var
  len : integer;
begin
  len := length( strn );
  while strn[len] = ' ' do
    len := len - 1;
  strn[0] := chr( len );
end; { remove_spaces }


procedure Get_User_Input( var strn: vstring80; var sym: symtype;
  var num: integer; var realnum: real );

var
  kk,
  len : integer;

begin

  num     := 0;
  realnum := 0.0;
  strn    := '';
  ch := ' ';
  while not ( (ch > ' ') or eoln ) do read( ch );
  if ch > ' ' then strn := ch;

  if not eoln then
    begin
      repeat
        read( ch );
        strn := strn + ch;
      until (ch <= ' ') or eoln;
    end;

  len := length( strn );
  if len = 0 then sym := nulsym
  else
    begin
      sym := strsym;
      if strn[1] in ['0'..'9'] then
        begin
          sym := numsym;
          {$R-}
          val( strn, num, kk );
          {$R+}
          realnum := num;
        end;
    end;

end; { Get_User_Input }

procedure Get_Sentence( var strn: vstring80; var len: integer );

begin
  readln( strn );
  len := length( strn );
end; { Get_Sentence }

end.
