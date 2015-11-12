@ECHO OFF


REM PhpVagrantMulti.rb
REM PhpVagrantMulti - PHP vagrant multipurpose vm
REM
REM AUTHORS::   Seth Griffin <griffinseth@yahoo.com>
REM Copyright:: Copyright 2015 Authors
REM License::   GPLv3
REM
REM This file is part of PhpVagrantMulti.
REM PhpVagrantMulti is free software: you can distribute it and/or modify
REM it under the terms of the GNU General Public License as published by
REM the Free Software Foundation, either version 3 of the License, or
REM (at your option) any later version.
REM
REM PhpVagrantMulti is distributed in the hope that it will be useful,
REM but WITHOUT ANY WARRANTY; without even the implied warranty of
REM MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
REM GNU General Public License for more details.
REM
REM You should have received a copy of the GNU General Public License
REM along with PhpVagrantMulti.  If not, see <http://www.gnu.org/licenses/>.


vagrant plugin install vagrant-omnibus
vagrant plugin install vagrant-berkshelf
vagrant up
