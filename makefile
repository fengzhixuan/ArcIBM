#-----------BEGIN MAKEFILE-------------------------------------------------
            SHELL         = /bin/sh
            DEF_FLAGS     = -P -C -traditional 
            EXEC          = ArcIBM
#==========================================================================
#  BEG USER DEFINITION SECTION
#    REQUIRED:
#       1.) Fortran90 Compiler
#       2.) NetCDF 3.x libraries with Fortran90 interface 
#           it would be best if they were built using the same compiler
#       3.) In some compilers, iargc/getarg are not standard
#           for example, Absoft 9.x requires a link to library U77 (-lU77)
#           if you are using gfortran/intel you should not have to worry
#           about this.
#==========================================================================
#         ==== REQUIRED
# Delmar
#          IOLIBS       =  -L/share/apps/netcdf-4.1.2_intel/lib -lnetcdf -lnetcdff 
#          IOINCS       =  -I/share/apps/netcdf-4.1.2_intel/include
# Scylla
# 	IOLIBS       =  -L/share/apps/netcdf-4.1.3_intel-2011.4.191/lib -lnetcdf -lnetcdff
#	IOINCS       =  -I/share/apps/netcdf-4.1.3_intel-2011.4.191/include
# Kenny
	IOINCS = -I/soft/netcdf-4.3.2-intel/include -I/soft/netcdf-fortran-4.2-intel/include
	IOLIBS = -L/soft/netcdf-4.3.2-intel/lib64 -lnetcdf -L/soft/netcdf-fortran-4.2-intel/lib64 -lnetcdff
#--------------------------------------------------------------------------
# OpenMP Options
#--------------------------------------------------------------------------
	OPENMP    	= -openmp

#--------------------------------------------------------------------------
# LINUX / ifort 
#--------------------------------------------------------------------------
          CPPFLAGS = $(DEF_FLAGS) -DINTEL
          CPP      = /usr/bin/cpp
          FC       = ifort
          OPT      = $(OPENMP) -limf -O3
#          OPT      = -g -O3
#          ==== OPTIONAL
#          FLINK    = /bin/sh /usr/local/netcdf/gfortran/bin/libtool  --mode=link gfortran
#          DEBFLGS  =
#          OPT      =

#==========================================================================
#  END USER DEFINITION SECTION
#==========================================================================

         FFLAGS = $(DEBFLGS) $(OPT) 
         MDEPFLAGS = --cpp --fext=f90 --file=-
         RANLIB = ranlib

#--------------------------------------------------------------------------
#  Libraries / Include Files          
#--------------------------------------------------------------------------

	LIBS  =     $(IOLIBS)
	INCS  =     $(IOINCS) 

#--------------------------------------------------------------------------
#  Preprocessing and Compilation Directives
#--------------------------------------------------------------------------
.SUFFIXES: .o .f90 

.f90.o:
	$(FC) -c $(FFLAGS) $(FIXEDFLAGS) $(INCS) $(INCLDIR) $*.f90  

#--------------------------------------------------------------------------
#  BISCM Source Code.
#--------------------------------------------------------------------------


F95FILES=    gparms.f90 utilities.f90 mod_pvar.f90 mod_igroup.f90 mod_bio.f90\
             mod_setup.f90 mod_driver.f90  mod_output.f90 mod_forcing.f90 biomas_driver.f90\
             mod_unstructured_compute.f90 mod_structured_compute.f90\
	         fvcom_driver.f90 ArcIBM.f90


 SRCS = $(F95FILES) 

 OBJS = $(SRCS:.f90=.o)

#--------------------------------------------------------------------------
#  Linking Directives               
#--------------------------------------------------------------------------

$(EXEC):	$(OBJS)
#		$(FLINK) $(FFLAGS) $(INCS) $(LDFLAGS) -o $(EXEC) $(OBJS) $(LIBS)
		$(FC) $(FFLAGS) $(LDFLAGS) -o $(EXEC) $(OBJS) $(LIBS)

#--------------------------------------------------------------------------
#  Target to create dependecies.
#--------------------------------------------------------------------------

depend:
		makedepf90  $(SRCS) >> makedepends


#--------------------------------------------------------------------------
#  Tar Up Code                           
#--------------------------------------------------------------------------

tarfile:
	tar cvf ArcIBM.tar *.f90  makefile *.txt *.nml  makedepends make.inc

#--------------------------------------------------------------------------
#  Cleaning targets.
#--------------------------------------------------------------------------

clean:
		/bin/rm -f *.o *.mod 

#--------------------------------------------------------------------------
#  Common rules for all Makefiles - do not edit.
#--------------------------------------------------------------------------

emptyrule::

#--------------------------------------------------------------------------
#  Empty rules for directories that do not have SUBDIRS - do not edit.
#--------------------------------------------------------------------------

install::
	@echo "install in $(CURRENT_DIR) done"

install.man::
	@echo "install.man in $(CURRENT_DIR) done"

Makefiles::

includes::
include ./makedepends
