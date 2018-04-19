# ArcIBM
<Arctic copepod Individual-Based Model (ArcIBM) v1.0>
    Copyright (C) <2018>  <Zhixuan Feng>
  
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

This git repository contains trunk version of source code (v1.0) for running copepod Individual-Based Model (ArcIBM).
Makefile is available for compilation using Intel Fortran compiler ONLY (other compilers such as gfortran DO NOT work).
Pre-installed Netcdf librares are also required.

For ArcIBM details, please refer to our papers:
Feng, Z., R. Ji, R. G. Campbell, C. J. Ashjian, and J. Zhang (2016), Early ice retreat and ocean warming may induce copepod biogeographic boundary shifts in the Arctic Ocean, J. Geophys. Res. Ocean., 121, 6137–6158, doi:10.1002/2016JC011784.
Feng, Z., R. Ji, C. Ashjian, R. Campbell, and J. Zhang (2018), Biogeographic responses of the copepod Calanus glacialis to a changing Arctic marine environment, Glob. Chang. Biol., 24, 159–170, doi:10.1111/gcb.13890.

To test run the model, you would need the following files:
(1) an Intel Fortran compiler with OpenMP capability;
(2) a netcdf forcing file (.nc) to provide physical and biological forcing field;
(3) a namelist file (.nml) to define parameters and provide necessary information;
(4) a job script file (.sh) for job submission;

For inquiries, please contact:
Dr. Zhixuan Feng
Woods Hole Oceanographic Institution
zfeng@whoi.edu
