/**********************************************************************
 * TDRP params for DsFileDist
 **********************************************************************/

//======================================================================
//
// LOCAL DISTRIBUTION PARAMETERS.
//
// Only set these parameters in the local _DsFileDist files in the data 
//   directory tree. To avoid confusing behavior, it is good practice not 
//   to override the DEBUGGING or DIRECTORY SEARCH parameters.
//  
// DsFileDist searches recursively down from the top dir, looking for 
//   _DsFileDist parameter files or _latest_data_info files - see 
//   'find_mode' for a more detailed explanation. When a _DsFileDist file 
//   is found, it overrides the gobal parameters.
//  
// If 'process' in the local params is FALSE, DsFileDist does not 
//   distribute files from that directory or any below it. This is useful 
//   for marking areas as off-limits so that they are not included in the 
//   search.
//
//======================================================================
 
///////////// process /////////////////////////////////
//
// Processing flag - controls whether we process this directory or not.
// If FALSE, stop looking for _DsFileDist param files and do not process 
//   this directory. If TRUE, process using the param information at this 
//   level.
// Type: boolean
//

process = TRUE;

///////////// find_mode ///////////////////////////////
//
// Mode for finding directories to be distributed.
//  
// FIND_DSFILEDIST_PARAMS: DsFileDist searches recursively from 
//   source_top_dir for '_DsFileDist' param files. If a '_DsFileDist' file 
//   is found, the directory is marked as active and files are distributed 
//   using the information in the _DsFileDist param file. Once a 
//   _DsFileDist file is found, the search does not continue below that 
//   directory, unless the find_mode is switched to FIND_LATEST_DATA_INFO. 
//   The parameters in the '_DsFileDist' file override those in the main 
//   parameters, and the combined parameters are used to control the file 
//   distribution. It is good practice to only include parameters in the 
//   LOCAL section, so that parameters such as debug and instance are not 
//   overridden.
//  
// If 'process' in the local params is FALSE, DsFileDist does not 
//   distribute files from that directory.
//  
// FIND_LATEST_DATA_INFO: if this is set in a '_DsFileDist' file, then 
//   we search recursively below that directory for '_latest_data_info' 
//   files insead of _DsFileDist param files. If a _latest_data_info file 
//   is found, the directory is marked as active, and the search does not 
//   continue below that level. The information in the _latest_data_info 
//   file, PLUS parameters set in the _DsFileDist file which set 
//   FIND_LATEST_DATA_INFO mode, are used to control distribution. The 
//   directory part of the URL is determined by stripping RAP_DATA_DIR (or 
//   DATA_DIR) from the active directory path.
//  
// See dest_url_template and dest_url_list for more on the directory 
//   settings in the url.
//
// Type: enum
// Options:
//     FIND_DSFILEDIST_PARAMS
//     FIND_LATEST_DATA_INFO
//

find_mode = FIND_LATEST_DATA_INFO;

///////////// _dsFileDist_ext /////////////////////////
//
// Optional extension for _DsFileDist param files.
// Normally DsFileDist scans the directory tree for files named 
//   _DsFileDist. However, if this string has a non-zero length, it is 
//   appended to _DsFileDist as an extension, and only those files with 
//   the extension will be considered. For example, if the extension is 
//   set to 'special', then only param files named '_dsFileDist.special' 
//   will be considered.
// Type: string
//

_dsFileDist_ext = "matlab";

///////////// latest_data_info_avail //////////////////
//
// Indicates that _latest_data_info is available for reading.
// Only applies to FIND_DSFILEDIST_PARAMS mode. If TRUE, we use the 
//   _latest_data_info files for notification that a file has arrived. 
//   Otherwise we scan the directory recursively for new files, and a 
//   latest_data_info file is created by this program to keep track of 
//   distribution times.
// Type: boolean
//

latest_data_info_avail = TRUE;

///////////// max_valid_age ///////////////////////////
//
// Max valid age of files to be transferred (secs).
// When checking for new files to distribute, files older than this will 
//   be ignored. See also 'max_age_at_copy_time'.
// Minimum val: 1
// Type: int
//

max_valid_age = 360000;

///////////// file_quiescence_age /////////////////////
//
// Quiesence on a file before it is assumed to be complete (secs).
// Only applicable when latest_data_info_avail = false. The program will 
//   wait for a file to stop growing before deciding that it has been 
//   completely written to disk.
// Minimum val: 1
// Type: int
//

file_quiescence_age = 5;

///////////// check_file_ext //////////////////////////
//
// Option to only copy files with a given extension.
// If TRUE, only files with extensions which match the parameter 
//   'data_file_ext' will be copied.
// Type: boolean
//

check_file_ext = FALSE;

///////////// data_file_ext ///////////////////////////
//
// Specified data file extension before distribution.
// See 'check_file_ext'.
// Type: string
//

data_file_ext = "";

///////////// allow_redistribution ////////////////////
//
// Option to allow redistribution of DsFileDist files.
// If TRUE, allows files which have already been distributed by 
//   DsFileDist to be forwarded on. If FALSE, does not allow the 
//   redistribution of files which have already been distributed once. 
//   This is useful to prevent infinte loops in distribution of files 
//   between redundant hosts.
// Type: boolean
//

allow_redistribution = TRUE;

///////////// force_copy //////////////////////////////
//
// Option to force copy. Uses single TCP/IP message.
// If TRUE, a single put message will be sent from the client to the 
//   server. The file will always be written, even if it already exists. 
//   If FALSE, the client will request the server to tell it whether to 
//   send the file. This request is made via an 'enquire' message. The 
//   server will tell the client whether to send the file. It will decline 
//   the copy request if the file already exists, and if the age of the 
//   file is less than the 'overwrite-age' parameter. This mode is 
//   intended for use with redundant data sources in which the file may be 
//   sent from more than one client.
// Type: boolean
//

force_copy = FALSE;

///////////// overwrite_age ///////////////////////////
//
// Overwrite age for existing file on target machine (secs).
// If force_copy is true, the copy will be forced even if file exists on 
//   target machine. If force_copy is false, the file age on target 
//   machine will be checked. If the age exceeds 'overwrite_age', the file 
//   will be copied over existing file. If overwrite_age is -1, the file 
//   will never be overwritten.
// Type: int
//

overwrite_age = -1;

///////////// max_age_at_copy_time ////////////////////
//
// Max allowable age of files when copying starts (secs).
// Before the program starts to copy a file, it will check the file age. 
//   If the age exceeds this maximum, the file will not be copied. See 
//   also 'max_valid_age'. The problem is that sometimes the network 
//   connection is bad or goes down, and the copying gets behind. When 
//   that happens, it may be that the program will try to copy files which 
//   are old. This parameter allows you to prevent old files from being 
//   copied. Set to -1 to disable checking, i.e., to force copying 
//   irrespective of the file age.
// Type: int
//

max_age_at_copy_time = 3600;

///////////// remove_after_copy ///////////////////////
//
// Option to remove the file after copying.
// Normally the file is not removed after copying. Setting this to TRUE 
//   will cause the file to be removed after a successful copy. This will 
//   only apply for a single URL destination. If you have more than 1 
//   destination this parameter will be ignored and an error message will 
//   be generated.
// Type: boolean
//

remove_after_copy = FALSE;

///////////// write_ldata_to_input_dir ////////////////
//
// Option to write the latest data file to the input dir.
// This is useful for keeping the data mapper up to date for external 
//   data sets which do not have a _latest_data_info file. This will only 
//   apply if 'latest_data_info_avail' is false.
// Type: boolean
//

write_ldata_to_input_dir = FALSE;

///////////// compression_type ////////////////////////
//
// Compression type for transfer.
// RLE - simple run-length encoding, fastest. LZO - fast, not very 
//   compact, better than RLE. ZLIB - same as gzip, but without headers. 
//   Not as fast as LZO, better than RLE. More compact than RLE and LZO. 
//   BZIP - slow, very compact. GZIP - recommended.
//
// Type: enum
// Options:
//     COMPRESSION_NONE
//     COMPRESSION_RLE
//     COMPRESSION_LZO
//     COMPRESSION_ZLIB
//     COMPRESSION_BZIP
//     COMPRESSION_GZIP
//

compression_type = COMPRESSION_NONE;

///////////// use_dest_host_list_file /////////////////
//
// Use host list in the file to create the destination urls.
// The host list file contains a list of destination hosts. Each entry 
//   in this list is merged with the url_template to create a list of 
//   destination urls.
// Type: boolean
//

use_dest_host_list_file = FALSE;

///////////// dest_url_list ///////////////////////////
//
// Specified URL list for destination hosts.
//  
// This is only used if parameter 'use_dest_host_list_file' is FALSE.
//  
// URL format: fcopyp:://targethost:port:dir
//  
// The files will be distributed to this list of hosts.
//  
// If the directory part is empty, the target directory will be the same 
//   as the source directory, relative to RAP_DATA_DIR or DATA_DIR.
//  
// If the directory part is set, the target directory will be as 
//   specified, relative to RAP_DATA_DIR or DATA_DIR, unless the dir 
//   starts with /, in which case it is taken as the absolute path.
//  
// For FIND_LATEST_DATA_INFO mode: if the directory part is empty, the 
//   target directory will be the same as the source directory, relative 
//   to $DATA_DIR. If the directory part is set, the target directory will 
//   be $DATA_DIR + specified-dir + 
//   source-dir-relative-to-_DsFileDist-file.
//  
// DsFileDist will NOT distribute files to either 'localhost' or the IP 
//   address of the local host, unless you specify the target directory. 
//   This behavior prevents an infinite loop caused by recursively writing 
//   data to a directory, then distributing it to itself. If you want to 
//   copy files to a different directory, MAKE SURE you have set a 
//   different directory, to prevent the infinit loop problem.
//  .
// Type: string
// 1D array - variable length.
//

dest_url_list = { "fcopyp:://control::" };

///////////// dest_host_list_file_path ////////////////
//
// Path for destination host list file.
// Only used if parameter 'use_dest_host_list_file' is TRUE.
// Type: string
//

dest_host_list_file_path = "$(PROJ_DIR)/system/params/dist_host_list.dmgt";

///////////// dest_url_template ///////////////////////
//
// URL template for all destination URLs.
//  
// Only used if parameter 'use_dest_host_list_file' is TRUE.
//  
// The host names from dest_host_list file are inserted into this 
//   template to create an array of URLs.
//  
// See dest_url_list for rules on setting the target directory.
//  
// Example:
//  
// Suppose the template is:
// 	fcopyp:://::my_dir
// And the dest_host_list is:
// 	luna
// 	earth
// 	mercury
// Then the actual url list would be
// 	fcopyp:://luna::my_dir
// 	fcopyp:://earth::my_dir
// 	fcopyp:://mercury::my_dir
//  .
// Type: string
//

dest_url_template = "fcopyp:://::";

///////////// minimum_expected_transfer_speed /////////
//
// Minimum expected transfer speed (kBytes/sec).
// This should be set to the minimum speed expected on any of the lines 
//   to be used. The expected transfer time is set using this speed. If 
//   the transfer takes more than 10 times the expected time, the transfer 
//   is killed.
// Type: int
//

minimum_expected_transfer_speed = 128;

///////////// reorder_by_file_size ////////////////////
//
// Option to use file size to alter the order for sending files.
// If FALSE, files are sent in the order in which they appear on the 
//   disk. If TRUE, this order is modified by the relative size of the 
//   files to be sent. See 'max_reorder_delay_fraction'.
// Type: boolean
//

reorder_by_file_size = FALSE;

///////////// max_reorder_delay_fraction //////////////
//
// The cumulative delay fraction used to make reorder decisions.
// If reorder_by_file_size is TRUE, small files may be inserted into the 
//   put list ahead of larger files. This parameter controls how that 
//   decision is made. When we insert a file in the queue, we note its 
//   size, 'file_size'. Once it is in the queue, we keep track of how many 
//   bytes are inserted ahead of it, 'nbytes_inserted'. We compute the 
//   delay_fraction as nybytes_inserted divided by file_size. We only 
//   allow a file to be inserted ahead of another file if the delay 
//   fraction does not exceed this parameter, reorder_delay_fraction. The 
//   bytes inserted cause a delay for the files behind. Using this scheme, 
//   the fractional delay per file will always be less than the fraction 
//   specified.
// Minimum val: 0
// Maximum val: 1
// Type: float
//

max_reorder_delay_fraction = 0.4;

