use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
	      NAME	=> 'Text::Brew',
	      VERSION	=> '0.01',
	      LINKTYPE	=> '$(INST_PM)',
	     );