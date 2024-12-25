# Log_analysis.exe

## introduce
This app can analysis log file expectantly Logitech UTS, Intretech ITTS log file generated in c:\csv_log


## key feature
- log file title field alignment function 
- analysis log to provide a proper test limit  (+-3 sigma. +-6 sigma)
- show destruction by chart 

## operation
- analysis chart can 
- zooom in / out ( mouse wheel   + -)
- horzental zoom  ( alt + mouse wheel )
- vertical  zoom  ( shift + mouse wheel )
- control down arrow key to search next fail unit
- control up arrow key to search previous fail unit
- sorting by sno
- sorting current field

simple drag and drop the file form file explore or file manager application.
select the column you want to analysis 

- click show char
- double click show standard devision and related analysis parameter
- right click to actve some other feature to analysis immediately.


## Coding

- unzip  synapse40.zip  to  lazarus's component directory.
- i.e. c:\lazarus\components\synapse40\
- or maybe in d:\lazarus\components\synapse40\
- 
- in lazarus,  add a component by 
- menu--> package-->open package file--> 
- D:\lazarus\components\synapse40\source\lib\laz_synapse.lpk
- or 
- c:\lazarus\components\synapse40\source\lib\laz_synapse.lpk
- 
- load it, compile it, and use --> install it

- - -

## History
new feature : online update 
use synapse40  to achieve this feature.

## license
This project is licensed under the MIT License - see the LICENSE.txt file for details
[License.txt](https://github.com/vincentcheng2116/vincentcheng2116/blob/main/License.txt)
