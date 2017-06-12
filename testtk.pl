#!/perl/bin/perl -w
###use lib "d:/perl/lib/tk";
use Tk;

#my $mw=MainWindow->new;
#$mw->title("Hit or Stay?");
#$mw->Button(-text=>"Hello World", -command=>sub{exit})->pack;
#MainLoop;


$screen=MainWindow->new;
$screen->title("Hit or Stay?");
$hit=$screen->Button(-activeforeground=>"green", -text=>"Hit Me", -command=>sub{HitButton}) ->pack(-side=>"left", -padx=>"3m" );
$stay=$screen->Button(-activeforeground=>"red", -text=>"Stay")->pack(-side=>"right", -after=>$hit, -padx=>"3m" );
$hit->configure(-width=>30);
$stay->configure(-width=>30);
MainLoop;


sub Play{

exit;

}


@list=['command=>"New"','-command=>\&Play']; 

$mw=MainWindow->new->(-bg=>"green", -height=>"6i", -width=>"8i")->title("Black Jack")
###->Frame(-height=>"1i", -width=>"8i", -bg=>"black");
$mainwindow->Menubutton(-text=>"Game", -menuitems=> @list);

##$mw
###
MainLoop;

##
###$menu->Menubutton(-text=>"Game")->command=>sub{Play});
###$button( -menuitems=>'command'=>"New", -command=>\&Play);
###$screen->Button(-activeforeground=>"green", -text=>"Hit Me", -command=>sub{HitButton}) ->pack(-side=>"left", -padx=>"3m" );
###
###$menu=

