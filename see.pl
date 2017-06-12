#!/perl/bin/perl -w
use Tk;

$see="it shows";
$cardCount="Cards Left:  $see" ;
###Create Main Window.

$screen=MainWindow->new(-height=>"6i", -width=>"8i", -title=>"Black Jack");
$screen->packPropagate(0);

###Create Counter.
$counter=$screen->Text( -font=>"terminal", -relief=>"sunken")->pack;
$counter->insert('insert', $cardCount, 'bold');

MainLoop;