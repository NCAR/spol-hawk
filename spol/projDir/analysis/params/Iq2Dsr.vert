/**********************************************************************
 * TDRP params for Iq2Dsr
 **********************************************************************/

//======================================================================
//
// Iq2Dsr reads raw time-series data, computes the moments and writes 
//   the contents into a DsRadar FMQ.
//
//======================================================================
 
//======================================================================
//
// DEBUGGING AND PROCESS CONTROL.
//
//======================================================================
 
///////////// debug ///////////////////////////////////
//
// Debug option.
// If set, debug messages will be printed appropriately.
//
// Type: enum
// Options:
//     DEBUG_OFF
//     DEBUG_NORM
//     DEBUG_VERBOSE
//     DEBUG_EXTRA_VERBOSE
//

debug = DEBUG_OFF;

///////////// instance ////////////////////////////////
//
// Process instance.
// Used for registration with procmap.
// Type: string
//

instance = "vert";

//======================================================================
//
// MODE OF OPERATION.
//
//======================================================================
 
///////////// mode ////////////////////////////////////
//
// Operating mode.
// In REALTIME mode, the program waits for a new input file. In ARCHIVE 
//   mode, it moves through the list of file names specified on the 
//   command line. In SIMULATE mode, the program moves repeatedly through 
//   the file list, creating output files with times set to now. This is 
//   useful for simulating an operational radar. In FMQ mode, the program 
//   opens the input_fmq, and reads time series data from the queue.
//
// Type: enum
// Options:
//     ARCHIVE
//     REALTIME
//     SIMULATE
//     FMQ
//

mode = FMQ;

///////////// use_multiple_threads ////////////////////
//
// Option to use multiple threads to improve performance.
// The read, compute and write stages can overlap in time, to improve 
//   performance. Also, the compute stage can be split into multiple 
//   threads, with each thread working on a discrete number of gates.
// Type: boolean
//

use_multiple_threads = TRUE;

///////////// n_compute_threads ///////////////////////
//
// The number of compute threads.
// The moments computations are segmented in range, with each thread 
//   computing a fraction of the number of gates. For maximum performance, 
//   n_threads should be set to the number of processors multiplied by 4. 
//   For further tuning, use top to maximize CPU usage while varying the 
//   number of threads.
// Minimum val: 1
// Type: int
//

n_compute_threads = 8;

//======================================================================
//
// TIME-SERIES FILE DATA INPUT.
//
//======================================================================
 
///////////// input_dir ///////////////////////////////
//
// Dir for input data files.
// This is used in REALTIME mode only. In ARCHIVE and SIMULATE modes, 
//   the file paths are specified on the command line.
// Type: string
//

input_dir = "./input";

///////////// use_ldata_info_file /////////////////////
//
// Option to use _latest_data_info file as input trigger.
// REALTIME mode only. If true, waits on _latest_data_info file. If 
//   false, scans the directory for new file.
// Type: boolean
//

use_ldata_info_file = FALSE;

///////////// max_realtime_valid_age //////////////////
//
// Max valid age of rdata input files in realtime mode (secs).
// This the max valid age for an incoming file. The program will wait 
//   for a data file more recent than this age.
// Minimum val: 1
// Type: int
//

max_realtime_valid_age = 360;

///////////// input_fmq ///////////////////////////////
//
// FMQ name for time series data.
// This is used in FMQ mode only.
// Type: string
//

input_fmq = "$(DATA_DIR)/fmq/ts_vert";

///////////// position_fmq_at_start ///////////////////
//
// Option to position the input FMQ at the start of the queue.
// FMQ mode only. If false, we start reading at the end of the queue. 
//   This is the default behavior. If true, we position the read pointer 
//   at the start of the queue, and read all data available in the queue 
//   before starting to read new data.
// Type: boolean
//

position_fmq_at_start = FALSE;

///////////// invert_hv_flag //////////////////////////
//
// Option to invert the sense of the HV flag in alternating mode.
// In alternating dual-pol mode, the HV flag indicates whether the pulse 
//   is horizontally or vertically polarized. Normally 1 indicates H and 0 
//   V. This parameter allows you to invert the sense of the flag, so that 
//   1 is interpreted as V and 0 as H.
// Type: boolean
//

invert_hv_flag = FALSE;

//======================================================================
//
// RADAR PARAMETERS.
//
// Some radar parameters may be included in the time series data. This 
//   section allows you to optionally override some of those values.
//
//======================================================================
 
///////////// override_radar_name /////////////////////
//
// Option to override the radar name.
// If true, the name in this file will be used. If not, the name in the 
//   time series data will be used.
// Type: boolean
//

override_radar_name = FALSE;

///////////// radar_name //////////////////////////////
//
// Name of the radar.
// See 'override_radar_name'.
// Type: string
//

radar_name = "SPOL";

///////////// override_radar_location /////////////////
//
// Option to override the radar location.
// If true, the location in this file will be used. If not, the location 
//   in the time series data will be used.
// Type: boolean
//

override_radar_location = TRUE;

///////////// radar_latitude_deg //////////////////////
//
// Radar latitude (deg).
// See override_radar_location.
// Type: double
//

radar_latitude_deg = $(RADAR_LAT);

///////////// radar_longitude_deg /////////////////////
//
// Radar longitude (deg).
// See override_radar_location.
// Type: double
//

radar_longitude_deg = $(RADAR_LON);

///////////// radar_altitude_meters ///////////////////
//
// Radar altitude (meters).
// See override_radar_location.
// Type: double
//

radar_altitude_meters = $(RADAR_ALT_M);

///////////// override_gate_geometry //////////////////
//
// Option to override the gate geometry.
// If true, the gate_spacing and start_range in the time series data is 
//   overridden by the parameters in this file.
// Type: boolean
//

override_gate_geometry = FALSE;

///////////// gate_spacing_meters /////////////////////
//
// Gate spacing (meters).
// See override_gate_geometry.
// Type: double
//

gate_spacing_meters = 150;

///////////// start_range_meters //////////////////////
//
// Start range (meters).
// See override_gate_geometry.
// Type: double
//

start_range_meters = 150;

///////////// override_radar_wavelength ///////////////
//
// Option to override the radar wavelength.
// If true, the radar wavelength in this file will be used. If not, the 
//   wavelength in the time series data will be used if available.
// Type: boolean
//

override_radar_wavelength = FALSE;

///////////// radar_wavelength_cm /////////////////////
//
// Radar wavelength (cm).
// See override_radar_wavelength.
// Type: double
//

radar_wavelength_cm = 10;

///////////// scan_type_id ////////////////////////////
//
// Scan type id.
// Unique identifier for scan strategy.
// Type: int
//

scan_type_id = 0;

///////////// scan_type_name //////////////////////////
//
// Scan type name.
// Descriptive name for scan strategy.
// Type: string
//

scan_type_name = "Default";

///////////// atmos_attenuation ///////////////////////
//
// Atmospheric attenuation (dB/km).
// Reflectivity is corrected for this.
// Type: double
//

atmos_attenuation = 0.012;

//======================================================================
//
// RADAR CALIBRATION.
//
//======================================================================
 
///////////// startup_cal_file ////////////////////////
//
// File name for calibration to be read at startup. Required.
// When the program processes incoming data, it will attempt to read 
//   updated parameter files for the time of the data being read. If the 
//   startup calibration file cannot be read, the program will fail.
// Type: string
//

startup_cal_file = "$(PROJ_DIR)/analysis/params/spol_cal.vert.xml";

///////////// read_updated_cal_files //////////////////
//
// Option to read updated calibration.
// If true, an attempt will be made to read calibration files which are 
//   close in time to the time series data. These files will be searched 
//   for in cal_dir. This will be done every cal_recheck_period.
// Type: boolean
//

read_updated_cal_files = FALSE;

///////////// cal_dir /////////////////////////////////
//
// Directory path for calibration files.
// Calibration files are written to sub-directories below this path. 
//   Iq2Dsr scans all directories below this path for calibration files. 
//   The file names should be yyyymmdd_hhmmss.cal.
// Type: string
//

cal_dir = "/tmp/cal";

///////////// cal_recheck_period //////////////////////
//
// Frequency at which to check for new cal (secs).
// The program will scan the calibration directory structure once every 
//   period, to check for new calibration files.
// Type: int
//

cal_recheck_period = 600;

///////////// use_cal_from_time_series ////////////////
//
// Option to override cal in time series data.
// If false, the cal information in the time series data will be used. 
//   If true, the cal info in the param file will be used.
// Type: boolean
//

use_cal_from_time_series = FALSE;

//======================================================================
//
// MOMENTS COMPUTATIONS.
//
//======================================================================
 
///////////// moments_params //////////////////////////
//
// Moments algorithm parameters.
// Sets the moments algorithm parameters by searching through the list 
//   of available options.

// SEARCHING THE LIST: we check 3 possible conditions: (a) scan_mode, 
//   (b) prf (pulses per second) and (c) antenna rate in degrees/sec.

// To ensure that the data will always be processed, include as the last 
//   option a default entry in which none of the checks are performed.

// PROCESSING OPTIONS:
// (a) n_samples: number of hits.
// (b) index_the_beams: compute beams indexed on evenly-spaced angles.
// (c) index_resolution: angular resolution of the indexed beams.
// (d) min_antenna_rate_for_indexing (deg/sec): if the antenna rate is 
//   less than this value, non-indexed beams will be used.
// (e) window: window to be applied to time series. Note that if the 
//   VONHANN or BLACKMAN windows are used, the number of hits should be 
//   doubled, because these windows concentrate the power in the center 
//   50% of the time series. For SZ, no window should be set becasue SZ 
//   has its own window setting.
// (f) switching_receiver: set to true if the receiver swicthes on a 
//   pulse-by-pulse basis so that co-polar returns are always on the same 
//   channel.
// (g) xmit_rcv_mode:  mode for xmit and receive for polarization 
//   diversity
// (h) prf_mode: FIXED or STAGGERED.
// (i) apply_clutter_filter: should we apply clutter filtering?
// (j) apply_sz: should we apply SZ decoding?

// xmit_rcv_mode options:
//  SP: Single polarization
//  DP_ALT_HV_CO_ONLY: Dual pol, alternating transmission, copolar 
//   receiver only (e.g. CP2 S-band)
//  DP_ALT_HV_CO_CROSS: Dual pol, alternating transmission, co-polar and 
//   cross-polar receivers (e.g. SPOL with Mitch Switch and receiver in 
//   switching mode, CHILL)
//  DP_ALT_HV_FIXED_HV: Dual pol, alternating transmission, fixed H and 
//   V receivers (e.g. SPOL with Mitch Switch and receivers in fixed mode)
//  DP_SIM_HV_FIXED_HV: Dual pol, simultaneous transmission, fixed H and 
//   V receivers (e.g. NEXRAD upgrade, SPOL with T and receivers in fixed 
//   mode)
//  DP_SIM_HV_SWITCHED_HV: Dual pol, simultaneous transmission, 
//   switching H and V receivers (e.g. SPOL with T nd receivers in 
//   switching mode)
//  DP_H_ONLY_FIXED_HV: Dual pol, H transmission, fixed H and V 
//   receivers (e.g. CP2 X band)
//  DP_V_ONLY_FIXED_HV: Dual pol, V transmission, fixed H and V 
//   receivers.
//
// Type: struct
//   typedef struct {
//      boolean check_scan_mode;
//      scan_mode_t scan_mode;
//        Options:
//          SCAN_MODE_UNKNOWN
//          SCAN_MODE_CALIBRATION
//          SCAN_MODE_SECTOR
//          SCAN_MODE_COPLANE
//          SCAN_MODE_RHI
//          SCAN_MODE_VERTICAL_POINTING
//          SCAN_MODE_TARGET
//          SCAN_MODE_MANUAL
//          SCAN_MODE_IDLE
//          SCAN_MODE_SURVEILLANCE
//          SCAN_MODE_AIRBORNE
//          SCAN_MODE_HORIZONTAL
//          SCAN_MODE_SUNSCAN
//          SCAN_MODE_POINTING
//          SCAN_MODE_FOLLOW_VEHICLE
//      boolean check_prf;
//      double prf_lower_limit;
//      double prf_upper_limit;
//      boolean check_antenna_rate;
//      double antenna_rate_lower_limit;
//      double antenna_rate_upper_limit;
//      int n_samples;
//      boolean index_the_beams;
//      double indexed_resolution;
//      double min_antenna_rate_for_indexing;
//      window_t window;
//        Options:
//          WINDOW_RECT
//          WINDOW_VONHANN
//          WINDOW_BLACKMAN
//      boolean switching_receiver;
//      xmit_rcv_mode_t xmit_rcv_mode;
//        Options:
//          SP
//          DP_ALT_HV_CO_ONLY
//          DP_ALT_HV_CO_CROSS
//          DP_ALT_HV_FIXED_HV
//          DP_SIM_HV_FIXED_HV
//          DP_SIM_HV_SWITCHED_HV
//          DP_H_ONLY_FIXED_HV
//          DP_V_ONLY_FIXED_HV
//      prf_mode_t prf_mode;
//        Options:
//          PRF_MODE_FIXED
//          PRF_MODE_STAGGERED_2_3
//          PRF_MODE_STAGGERED_3_4
//          PRF_MODE_STAGGERED_4_5
//      boolean apply_clutter_filter;
//      boolean apply_sz;
//   }
//
// 1D array - variable length.
//

moments_params = {
  {
    check_scan_mode = TRUE,
    scan_mode = SCAN_MODE_SURVEILLANCE,
    check_prf = FALSE,
    prf_lower_limit = 0,
    prf_upper_limit = 2000,
    check_antenna_rate = TRUE,
    antenna_rate_lower_limit = 0,
    antenna_rate_upper_limit = 4,
    n_samples = 128,
    index_the_beams = TRUE,
    indexed_resolution = 0.25,
    min_antenna_rate_for_indexing = 0,
    window = WINDOW_VONHANN,
    switching_receiver = TRUE,
    xmit_rcv_mode = DP_ALT_HV_CO_CROSS,
    prf_mode = PRF_MODE_FIXED,
    apply_clutter_filter = TRUE,
    apply_sz = FALSE
  }
  ,
  {
    check_scan_mode = TRUE,
    scan_mode = SCAN_MODE_SURVEILLANCE,
    check_prf = FALSE,
    prf_lower_limit = 0,
    prf_upper_limit = 2000,
    check_antenna_rate = FALSE,
    antenna_rate_lower_limit = 0,
    antenna_rate_upper_limit = 90,
    n_samples = 192,
    index_the_beams = TRUE,
    indexed_resolution = 0.75,
    min_antenna_rate_for_indexing = 4,
    window = WINDOW_VONHANN,
    switching_receiver = TRUE,
    xmit_rcv_mode = DP_ALT_HV_CO_CROSS,
    prf_mode = PRF_MODE_FIXED,
    apply_clutter_filter = TRUE,
    apply_sz = FALSE
  }
  ,
  {
    check_scan_mode = TRUE,
    scan_mode = SCAN_MODE_SECTOR,
    check_prf = FALSE,
    prf_lower_limit = 0,
    prf_upper_limit = 2000,
    check_antenna_rate = FALSE,
    antenna_rate_lower_limit = 0,
    antenna_rate_upper_limit = 90,
    n_samples = 192,
    index_the_beams = TRUE,
    indexed_resolution = 0.75,
    min_antenna_rate_for_indexing = 4,
    window = WINDOW_VONHANN,
    switching_receiver = TRUE,
    xmit_rcv_mode = DP_ALT_HV_CO_CROSS,
    prf_mode = PRF_MODE_FIXED,
    apply_clutter_filter = TRUE,
    apply_sz = FALSE
  }
  ,
  {
    check_scan_mode = TRUE,
    scan_mode = SCAN_MODE_RHI,
    check_prf = FALSE,
    prf_lower_limit = 0,
    prf_upper_limit = 2000,
    check_antenna_rate = FALSE,
    antenna_rate_lower_limit = 0,
    antenna_rate_upper_limit = 90,
    n_samples = 128,
    index_the_beams = TRUE,
    indexed_resolution = 0.25,
    min_antenna_rate_for_indexing = -1.0,
    window = WINDOW_VONHANN,
    switching_receiver = TRUE,
    xmit_rcv_mode = DP_ALT_HV_CO_CROSS,
    prf_mode = PRF_MODE_FIXED,
    apply_clutter_filter = TRUE,
    apply_sz = FALSE
  }
  ,
  {
    check_scan_mode = FALSE,
    scan_mode = SCAN_MODE_SURVEILLANCE,
    check_prf = FALSE,
    prf_lower_limit = 0,
    prf_upper_limit = 2000,
    check_antenna_rate = FALSE,
    antenna_rate_lower_limit = 0,
    antenna_rate_upper_limit = 90,
    n_samples = 192,
    index_the_beams = TRUE,
    indexed_resolution = 1,
    min_antenna_rate_for_indexing = 3,
    window = WINDOW_VONHANN,
    switching_receiver = TRUE,
    xmit_rcv_mode = DP_ALT_HV_CO_CROSS,
    prf_mode = PRF_MODE_FIXED,
    apply_clutter_filter = TRUE,
    apply_sz = FALSE
  }
};

///////////// nsecs_for_antenna_rate //////////////////
//
// Time for computing azimuth rate (sec).
// The rate computed over this time period.
// Type: double
//

nsecs_for_antenna_rate = 0.2;

///////////// moments_snr_threshold ///////////////////
//
// Signal-to-noise value for thresholding (dB).
// This is the signal-to-noise ratio used to thresholding based on the 
//   noise.
// Type: double
//

moments_snr_threshold = -100;

///////////// correct_for_system_phidp ////////////////
//
// Option to correct for system phidp.
// If true, the H and V correlation phases will be corrected by 
//   adding/subtracting the system phidp value as appropriate. This avoids 
//   premature wrapping of the phased from which phidp and velocity are 
//   computed. If false, this correction will not be applied. To find the 
//   system phidp, set this to false and compute phidp for 
//   vertically-pointing data.
// Type: boolean
//

correct_for_system_phidp = TRUE;

///////////// use_h_only_for_alt_mode_clutter_vel /////
//
// Option to use H only pulses for computing clutter velocity in 
//   alternation dual pol mode.
// If false, the normal phidp-based method is used everywhere in 
//   alternating dual pol mode. If true, the H-only pulses are used to 
//   compute velocity where CMD flags a gate as clutter.
// Type: boolean
//

use_h_only_for_alt_mode_clutter_vel = TRUE;

///////////// use_simple_notch_clutter_filter /////////
//
// Option to use a simple notch for clutter filtering.
// If false, spectral adaptive clutter filtering is used. If true, a 
//   simple notch is used instead. The width is specified in 
//   notch_filter_width_mps. The depth of the notch is down to the 
//   calibrated noise floor.
// Type: boolean
//

use_simple_notch_clutter_filter = FALSE;

///////////// simple_notch_filter_width_mps ///////////
//
// Width of simple clutter notch (m/s).
// See use_simple_notch_clutter_filter.
// Type: double
//

simple_notch_filter_width_mps = 3;

//======================================================================
//
// REFRACTIVITY FIELDS.
//
//======================================================================
 
///////////// change_aiq_sign /////////////////////////
//
// Option to change sign on AIQ field.
// This affects refractt variables. Set to true to change the sign of 
//   the computed AIQ field.
// Type: boolean
//

change_aiq_sign = FALSE;

//======================================================================
//
// SZ8-64 PHASE CODING.
//
//======================================================================
 
///////////// negate_phase_codes //////////////////////
//
// Option to multiple phase codes by -1.
// In some data sets the phase codes are negated. Set this to true for 
//   such data cases.
// Type: boolean
//

negate_phase_codes = FALSE;

///////////// sz_strong_to_weak_power_ratio_threshold /
//
// Strong-to-weak power ratio censoring threshold (dB).
// SZ decoding only. If the strong to weak trip power ratio is greater 
//   than this, we censor the weak trip.
// Type: double
//

sz_strong_to_weak_power_ratio_threshold = 50;

///////////// sz_out_of_trip_power_ratio_threshold ////
//
// Ratio of peak power to off-peak replica power (dB).
// SZ decoding only. When checking for out-of-trip power after 
//   deconvolution, this is the threshold to be used. The power of the 
//   spectral peak is compared with the peak for the 6 lowest replicas. If 
//   the ratio is less that this for a given number of replicas, it is 
//   assumed that out-of-trip power is present. See 
//   'sz_out_of_trip_power_n_replicas'.
// Type: double
//

sz_out_of_trip_power_ratio_threshold = 6;

///////////// sz_out_of_trip_power_n_replicas /////////
//
// Number of replicas used for checking for out-of-trip power.
// SZ decoding only. When checking for out-of-trip power after 
//   deconvolution, this is the number of peaks to check. See 
//   'sz_out_of_trip_power_ratio_threshold'.
// Minimum val: 1
// Maximum val: 6
// Type: int
//

sz_out_of_trip_power_n_replicas = 3;

//======================================================================
//
// CMD - CLUTTER MITIGATION DECISION system.
//
// Option to compute and use CMD fields.
//
//======================================================================
 
///////////// cmd_kernel_ngates_tdbz //////////////////
//
// Length of CMD kernel in range for TDBZ (gates).
// TDBZ is computed over a kernel in range.
// Type: int
//

cmd_kernel_ngates_tdbz = 9;

///////////// cmd_kernel_ngates_spin //////////////////
//
// Length of CMD kernel in range for SPIN (gates).
// SPIN is computed over a kernel in range.
// Type: int
//

cmd_kernel_ngates_spin = 11;

///////////// cmd_kernel_ngates_zdr_sdev //////////////
//
// Length of CMD kernel in range for ZDR sdev (gates).
// sdev_zdr are computed over a kernel in range.
// Type: int
//

cmd_kernel_ngates_zdr_sdev = 7;

///////////// cmd_kernel_ngates_phidp_sdev ////////////
//
// Length of CMD kernel in range for PHIDP sdev (gates).
// sdev_phidp are computed over a kernel in range.
// Type: int
//

cmd_kernel_ngates_phidp_sdev = 7;

///////////// cmd_spin_dbz_threshold //////////////////
//
// Threshold for computing spin change in the CMD (dBZ).
// The SPIN change variable is computed using the difference in dBZ 
//   between adjacent gates. If the difference exceeds this threshold, the 
//   change counter is incremented.
// Type: double
//

cmd_spin_dbz_threshold = 6.5;

///////////// cmd_snr_threshold ///////////////////////
//
// Signal-to-noise ratio value for CMD (dB).
// Only gates which exceed this snr will be considered for the CMD flag.
// Type: double
//

cmd_snr_threshold = 3;

///////////// cpa_median_filter_len ///////////////////
//
// Length of median filter applied to CPA field in range (gates).
// Set to 1 if you do not want a median filter applied.
// Type: int
//

cpa_median_filter_len = 1;

///////////// cmd_threshold_for_clutter ///////////////
//
// Threshold CMD value for identifying clutter.
// If the CMD value exceeds this threshold, clutter is assumed to exist 
//   at that point.
// Type: double
//

cmd_threshold_for_clutter = 0.5;

///////////// apply_db_for_db_correction //////////////
//
// Option to apply db-for-db correction after applying CMD.
// When a significant level of clutter is present, the noise level in 
//   the speactral skirts rises. It is not possible to adjust for this 
//   directly in the filter. Therefore, and extra correction is needed. 
//   The db-for-db correction was developed in the legacy NEXRAD system. 
//   For every db of power removed by the filter below the 
//   db_for_db_threshold, an extra db_for_db is removed. For every db of 
//   power removed above the threshold, and extra 1 db is removed.
// Type: boolean
//

apply_db_for_db_correction = TRUE;

///////////// db_for_db_ratio /////////////////////////
//
// Ratio for computing clutter correction when below 
//   db_for_db_threshold.
// If the clutter power removed is less than db_for_db_threshold, the 
//   db_for_db_corection is the clutter db multiplied by this ratio.
// Type: double
//

db_for_db_ratio = 0.2;

///////////// db_for_db_threshold /////////////////////
//
// Threshold for db_for_db correction.
// If the computed clutter power is less than this threshold, then the 
//   db_for_db correction is computed as the db_for_db_ratio multiplied by 
//   the clutter power. If the clutter power exceeds this threshold, the 
//   correction is 1 db for every db by which the clutter exceeds the 
//   threshold.
// Type: double
//

db_for_db_threshold = 40;

///////////// apply_cmd_speckle_filter ////////////////
//
// Option to apply speckle filter to CMD flag field.
// If true, a speckle filter will be applied to the flag field after 
//   thresholding. There are two components to the filter: (a) it there 
//   are small gaps in the CMD field with a significant number of gates 
//   set on either side, then the gaps are filled in; (b) if there are 
//   isolated gates where the CMD flag is set, surrounded by gates not 
//   set, the flag is removed at those gates if the reflectivity at the 
//   flagged region does not exceed max reflectivity at the surrounding 
//   gates. See the following parameters for more details.
// Type: boolean
//

apply_cmd_speckle_filter = TRUE;

///////////// cmd_speckle_max_ngates_infilled /////////
//
// Max number of gates filled in by the speckle filter.
// The filter will only fill in sections surrounded by at least the same 
//   number of gates. For example, if one gate is not flagged but the 
//   gates on either side are, it is filled in. If two gates are not 
//   flagged but are surrounded by two flagged gates on either side, these 
//   are filled in. And so on up to this max numbed of gates to be filled 
//   in.
// Type: int
//

cmd_speckle_max_ngates_infilled = 3;

///////////// cmd_speckle_max_ngates_removed //////////
//
// Max number of gates removed by the speckle filter.
// The filter will only remove sections surrounded by at least the same 
//   number of gates. For example, if one gate is flagged but the gates on 
//   either side are not, it is removed provided the reflectivity does not 
//   exceed the surrounding gates by cmd_speckle_dbz_margin. If two gates 
//   are flagged but are surrounded by two unflagged gates on either side, 
//   these are removed if the max reflectivity in these two gates does not 
//   exceed the max in the surrounding 4 gates by at least 
//   cmd_speckle_dbz_margin. And so on up to this max numbed of gates to 
//   be removed.
// Type: int
//

cmd_speckle_max_ngates_removed = 2;

///////////// cmd_speckle_dbz_margin //////////////////
//
// Threshold CMD value for identifying clutter.
// If the CMD value exceeds this threshold, clutter is assumed to exist 
//   at that point.
// Type: double
//

cmd_speckle_dbz_margin = 0.5;

///////////// apply_nexrad_spike_filter_after_cmd /////
//
// Option to apply spike filter after the CMD.
// If true, the NEXRAD spike filter will be applied to the filtered 
//   fields.
// Type: boolean
//

apply_nexrad_spike_filter_after_cmd = TRUE;

//======================================================================
//
// CMD INTEREST MAPS and WEIGHTS.
//
// Each map should hold at least 2 points. The points should be 
//   increasing in value, i.e. the value should increase for each 
//   subsequent point. The various interest values are combined using the 
//   specified weights in a weighted mean to produce the final CMD value.
//
//======================================================================
 
///////////// tdbz_interest_map ///////////////////////
//
// Interest mapping for TDBZ.
//
// Type: struct
//   typedef struct {
//      double value;
//      double interest;
//   }
//
// 1D array - variable length.
//

tdbz_interest_map = {
  { 20, 0.001},
  { 40, 1}
};

///////////// spin_interest_map ///////////////////////
//
// Interest mapping for dBZ spin.
//
// Type: struct
//   typedef struct {
//      double value;
//      double interest;
//   }
//
// 1D array - variable length.
//

spin_interest_map = {
  { 15, 0.001},
  { 30, 1}
};

///////////// max_of_tdbz_and_spin_interest_weight ////
//
// Weight for max of TDBZ and SPIN interest.
// A combined interest field is formed by applying the interest maps to 
//   TDBZ and SPIN, and taking the maximum of the result. The combined 
//   field can then be used as an interest field instead of TDBZ and SPIN 
//   individually.
// Type: double
//

max_of_tdbz_and_spin_interest_weight = 1;

///////////// cpa_interest_map ////////////////////////
//
// Interest mapping for clutter phase alignment.
//
// Type: struct
//   typedef struct {
//      double value;
//      double interest;
//   }
//
// 1D array - variable length.
//

cpa_interest_map = {
  { 0.6, 0},
  { 0.9, 1}
};

///////////// cpa_interest_weight /////////////////////
//
// Weight for clutter phase alignment.
// Type: double
//

cpa_interest_weight = 1.0;

///////////// zdr_sdev_interest_map ///////////////////
//
// Interest mapping for zdr.
//
// Type: struct
//   typedef struct {
//      double value;
//      double interest;
//   }
//
// 1D array - variable length.
//

zdr_sdev_interest_map = {
  { 1.2, 0},
  { 2.4, 1}
};

///////////// zdr_sdev_interest_weight ////////////////
//
// Weight for standard deviation of zdr.
// Type: double
//

zdr_sdev_interest_weight = 1.0;

///////////// phidp_sdev_interest_map /////////////////
//
// Interest mapping for standard deviation of phidp.
//
// Type: struct
//   typedef struct {
//      double value;
//      double interest;
//   }
//
// 1D array - variable length.
//

phidp_sdev_interest_map = {
  { 10, 0},
  { 15, 1}
};

///////////// phidp_sdev_interest_weight //////////////
//
// Weight for standard deviation of phidp.
// Type: double
//

phidp_sdev_interest_weight = 1.0;

//======================================================================
//
// OUTPUT TO DSRADAR FMQ.
//
//======================================================================
 
///////////// output_fmq_url //////////////////////////
//
// Output URL for DsRadar data via FMQ.
// Type: string
//

output_fmq_url = "fmq/moments_vert";

///////////// output_fmq_size /////////////////////////
//
// Size of output FMQ, in bytes.
// This is the total size of the output FMQ buffer. Some of this buffer 
//   will be used for control bytes (12 bytes per message).
// Type: int
//

output_fmq_size = 100000000;

///////////// output_fmq_nslots ///////////////////////
//
// Number of slots in output FMQ.
// The number of slots corresponds to the maximum number of messages 
//   which may be written to the buffer before overwrites occur. However, 
//   overwrites may occur sooner if the size is not set large enough.
// Type: int
//

output_fmq_nslots = 7200;

///////////// output_fmq_compress /////////////////////
//
// FMQ compression option.
// If TRUE FMQ messages are compressed.
// Type: boolean
//

output_fmq_compress = FALSE;

///////////// nbeams_for_params_and_calib /////////////
//
// Number of beams between sending params and calibration.
// The params and calibration data is sent when the radar operation 
//   changes, as well as once every tilt. However, if none of these 
//   triggers a change, the params will be sent regardless when this 
//   number of beams have been written.
// Type: int
//

nbeams_for_params_and_calib = 90;

///////////// write_blocking //////////////////////////
//
// Option to set up the FMQ as blocking.
// If TRUE, FMQ will be set up FMQ for blocking operation. If the FMQ 
//   becomes full, Test2Dsr will then block until there is space for more 
//   data.
// Type: boolean
//

write_blocking = FALSE;

///////////// beam_wait_msecs /////////////////////////
//
// Wait per beam (milli-secs).
// ARCHIVE and SIMULATE modes only.
// Type: int
//

beam_wait_msecs = 0;

///////////// set_end_of_vol_from_elev_angle //////////
//
// Option to set the end of vol flag based on elevation angle.
// If true, the program will look for changes in antenna angle to 
//   compute the end of volume.
// Type: boolean
//

set_end_of_vol_from_elev_angle = FALSE;

///////////// vol_starts_at_bottom ////////////////////
//
// Flag to indicate that elevation angles increase in the volume.
// If the volume starts at the top, i.e. elevations decrease during the 
//   volume, set this to FALSE.
// Type: boolean
//

vol_starts_at_bottom = TRUE;

///////////// elev_change_for_end_of_vol //////////////
//
// Change in elevation which triggers and end of volume.
// If the elevation angle changes by this amount, and end of volume flag 
//   will be set.
// Minimum val: 0.1
// Type: double
//

elev_change_for_end_of_vol = 1.5;

///////////// min_beams_per_vol ///////////////////////
//
// Min number of beams per volume.
// Used to prevent end-of-volume conditions being determined during 
//   antenna transition to the start of the next volume. Only used for 
//   set_end_of_vol_from_elev_angle.
// Type: int
//

min_beams_per_vol = 360;

///////////// set_end_of_vol_on_prf_change ////////////
//
// Option to set the end-of-vol flag when the PRF changes.
// Type: boolean
//

set_end_of_vol_on_prf_change = TRUE;

///////////// output_fields ///////////////////////////
//
// Indicate which fields should be written to the Dsr FMQ.
// Choose the ID from the list. The name and units can be set however 
//   the user prefers. The scale and bias are applied to the floating 
//   point value to compute the 16-bit output value for the FMQ. The 
//   write_filtered and write_unfiltered flags indicate which fields 
//   should be written.
//
// Type: struct
//   typedef struct {
//      field_id_t id;
//        Options:
//          NCP
//          SNR
//          DBM
//          DBZ
//          VEL
//          WIDTH
//          CLUT
//          CLUT_NOISE
//          ZDR
//          ZDRM
//          LDRH
//          LDRV
//          RHOHV
//          PHIDP
//          KDP
//          SNRHC
//          SNRHX
//          SNRVC
//          SNRVX
//          DBMHC
//          DBMHX
//          DBMVC
//          DBMVX
//          CPA
//          TDBZ
//          SPIN
//          MAX_TDBZ_SPIN
//          ZDR_SDEV
//          PHIDP_SDEV
//          DBZ_DIFF_SQ
//          DBZ_SPIN_CHANGE
//          CMD
//          CMD_FLAG
//          AIQ
//          NIQ
//          MEANIQ_DB
//          MEANIQ_PHASE
//          SZ_TRIP_FLAG
//          SZ_LEAKAGE
//          CENSORING_FLAG
//          LAG0_HC_DB
//          LAG0_HX_DB
//          LAG0_VC_DB
//          LAG0_VX_DB
//          LAG0_HCVX_DB
//          LAG0_HCVX_PHASE
//          LAG0_VCHX_DB
//          LAG0_VCHX_PHASE
//          LAG1_HC_DB
//          LAG1_HC_PHASE
//          LAG1_VC_DB
//          LAG1_VC_PHASE
//          LAG1_HCVC_DB
//          LAG1_HCVC_PHASE
//          LAG1_VCHC_DB
//          LAG1_VCHC_PHASE
//          LAG1_VXHX_DB
//          LAG1_VXHX_PHASE
//          LAG2_HC_DB
//          LAG2_HC_PHASE
//          LAG2_VC_DB
//          LAG2_VC_PHASE
//          LAG3_HC_DB
//          LAG3_HC_PHASE
//          LAG3_VC_DB
//          LAG3_VC_PHASE
//          SDEV_VV
//          TEST
//      string name;
//      string units;
//      double scale;
//      double bias;
//      boolean write_unfiltered;
//      boolean write_filtered;
//   }
//
// 1D array - variable length.
//

output_fields = {
  { NCP, "NCP", "", 0.0001, -0.01, TRUE, TRUE},
  { SNR, "SNR", "dB", 0.01, -320, TRUE, TRUE},
  { DBM, "DBM", "dBm", 0.01, -320, TRUE, TRUE},
  { DBZ, "DBZ", "dBZ", 0.01, -320, TRUE, TRUE},
  { VEL, "VEL", "m/s", 0.01, -320, TRUE, TRUE},
  { WIDTH, "WIDTH", "m/s", 0.001, -0.01, TRUE, TRUE},
  { CLUT, "CLUT", "dB", 0.01, -320, TRUE, FALSE},
  { ZDR, "ZDR", "dB", 0.001, -32, TRUE, TRUE},
  { ZDRM, "ZDRM", "dB", 0.001, -32, TRUE, TRUE},
  { LDRH, "LDRH", "dB", 0.005, -160, TRUE, TRUE},
  { LDRV, "LDRV", "dB", 0.005, -160, TRUE, TRUE},
  { RHOHV, "RHOHV", "", 0.0001, -1, TRUE, TRUE},
  { PHIDP, "PHIDP", "deg", 0.06, -200, TRUE, TRUE},
  { KDP, "KDP", "deg/km", 0.001, -32, TRUE, TRUE},
  { SNRHC, "SNRHC", "dB", 0.01, -320, TRUE, TRUE},
  { SNRHX, "SNRHX", "dB", 0.01, -320, TRUE, TRUE},
  { SNRVC, "SNRVC", "dB", 0.01, -320, TRUE, TRUE},
  { SNRVX, "SNRVX", "dB", 0.01, -320, TRUE, TRUE},
  { DBMHC, "DBMHC", "dBm", 0.01, -320, TRUE, TRUE},
  { DBMHX, "DBMHX", "dBm", 0.01, -320, TRUE, TRUE},
  { DBMVC, "DBMVC", "dBm", 0.01, -320, TRUE, TRUE},
  { DBMVX, "DBMVX", "dBm", 0.01, -320, TRUE, TRUE},
  { CPA, "CPA", "", 0.0001, -1, TRUE, FALSE},
  { TDBZ, "TDBZ", "dBzSq", 0.1, -0.1, TRUE, FALSE},
  { SPIN, "SPIN", "", 0.01, -0.1, TRUE, FALSE},
  { MAX_TDBZ_SPIN, "MAX_TDBZ_SPIN", "", 0.0001, -1, TRUE, FALSE},
  { ZDR_SDEV, "ZDR_SDEV", "dB", 0.001, -32, TRUE, FALSE},
  { PHIDP_SDEV, "PHIDP_SDEV", "deg", 0.02, -640, TRUE, FALSE},
  { DBZ_DIFF_SQ, "DBZ_DIFF_SQ", "dBzSq", 0.01, -320, FALSE, FALSE},
  { DBZ_SPIN_CHANGE, "DBZ_SPIN_CHANGE", "", 0.01, -320, FALSE, FALSE},
  { CMD, "CMD", "", 0.001, -0.01, TRUE, FALSE},
  { CMD_FLAG, "CMD_FLAG", "", 1, -100, TRUE, FALSE},
  { AIQ, "AIQ", "deg", 0.12, -360, TRUE, FALSE},
  { NIQ, "NIQ", "dBm", 0.01, -320, TRUE, FALSE},
  { SZ_TRIP_FLAG, "SZ_TRIP_FLAG", "", 1, -1000, FALSE, FALSE},
  { SZ_LEAKAGE, "SZ_LEAKAGE", "", 0.0001, -1, FALSE, FALSE},
  { CENSORING_FLAG, "CENSORING_FLAG", "", 1, -1000, FALSE, FALSE},
  { LAG0_HC_DB, "LAG0_HC_DB", "dBm", 0.005, -160, TRUE, TRUE},
  { LAG0_HX_DB, "LAG0_HX_DB", "dBm", 0.005, -160, TRUE, TRUE},
  { LAG0_VC_DB, "LAG0_VC_DB", "dBm", 0.005, -160, TRUE, TRUE},
  { LAG0_VX_DB, "LAG0_VX_DB", "dBm", 0.005, -160, TRUE, TRUE},
  { LAG0_HCVX_DB, "LAG0_HCVX_DB", "dBm", 0.005, -240, FALSE, TRUE},
  { LAG0_HCVX_PHASE, "LAG0_HCVX_PHASE", "deg", 0.006, -190, FALSE, TRUE},
  { LAG0_VCHX_DB, "LAG0_VCHX_DB", "dBm", 0.005, -240, FALSE, TRUE},
  { LAG0_VCHX_PHASE, "LAG0_VCHX_PHASE", "deg", 0.006, -190, FALSE, TRUE},
  { LAG1_HC_DB, "LAG1_HC_DB", "dBm", 0.005, -240, FALSE, TRUE},
  { LAG1_HC_PHASE, "LAG1_HC_PHASE", "deg", 0.006, -190, FALSE, TRUE},
  { LAG1_VC_DB, "LAG1_VC_DB", "dBm", 0.005, -240, FALSE, TRUE},
  { LAG1_VC_PHASE, "LAG1_VC_PHASE", "deg", 0.006, -190, FALSE, TRUE},
  { LAG1_HCVC_DB, "LAG1_HCVC_DB", "dBm", 0.005, -240, FALSE, TRUE},
  { LAG1_HCVC_PHASE, "LAG1_HCVC_PHASE", "deg", 0.006, -190, FALSE, TRUE},
  { LAG1_VCHC_DB, "LAG1_VCHC_DB", "dBm", 0.005, -240, FALSE, TRUE},
  { LAG1_VCHC_PHASE, "LAG1_VCHC_PHASE", "deg", 0.006, -190, FALSE, TRUE},
  { LAG1_VXHX_DB, "LAG1_VXHX_DB", "dBm", 0.005, -240, FALSE, TRUE},
  { LAG1_VXHX_PHASE, "LAG1_VXHX_PHASE", "deg", 0.006, -190, FALSE, TRUE},
  { LAG2_HC_DB, "LAG2_HC_DB", "dBm", 0.005, -240, FALSE, TRUE},
  { LAG2_HC_PHASE, "LAG2_HC_PHASE", "deg", 0.006, -190, FALSE, TRUE},
  { LAG2_VC_DB, "LAG2_VC_DB", "dBm", 0.005, -240, FALSE, TRUE},
  { LAG2_VC_PHASE, "LAG2_VC_PHASE", "deg", 0.006, -190, FALSE, TRUE},
  { LAG3_HC_DB, "LAG3_HC_DB", "dBm", 0.005, -240, FALSE, TRUE},
  { LAG3_HC_PHASE, "LAG3_HC_PHASE", "deg", 0.006, -190, FALSE, TRUE},
  { LAG3_VC_DB, "LAG3_VC_DB", "dBm", 0.005, -240, FALSE, TRUE},
  { LAG3_VC_PHASE, "LAG3_VC_PHASE", "deg", 0.006, -190, FALSE, TRUE},
  { SDEV_VV, "SDEV_VV", "dBm", 0.01, -320, TRUE, FALSE},
  { TEST, "TEST", "", 0.01, -320, FALSE, FALSE}
};

//======================================================================
//
// SWEEP INFORMATION.
//
// Option to read volume and tilt numbers from sweep information in the 
//   incoming pulse data, or from data stored in SPDB.
//
//======================================================================
 
///////////// use_sweep_info_from_beam ////////////////
//
// Option to read sweep info from beam data.
// Type: boolean
//

use_sweep_info_from_beam = TRUE;

///////////// delay_tilt_start_msg_during_ant_trans ///
//
// Option to delay start of tilt message if antenna transition from beam 
//   data.
// Type: boolean
//

delay_tilt_start_msg_during_ant_trans = FALSE;

///////////// read_sweep_info_from_spdb ///////////////
//
// Option to read sweep info from SPDB.
// Type: boolean
//

read_sweep_info_from_spdb = FALSE;

///////////// sweep_url ///////////////////////////////
//
// URL for sweep information.
// Type: string
//

sweep_url = "spdbp:://localhost::spdb/sweepinfo/viraq";

///////////// sweep_search_margin /////////////////////
//
// Time margin for searching for relevant sweep info - secs.
// This is the time margin, on either side of the beam time, to search 
//   for sweep information. It should be at least as long as the maximum 
//   sweep duratation.
// Type: int
//

sweep_search_margin = 180;

//======================================================================
//
// TRANSITION FLAG.
//
//======================================================================
 
///////////// transition_method ///////////////////////
//
// Method for identifying whether a beam occurs during an antenna 
//   transition.

// Some time series data includes a transition flag, which indicates 
//   when the antenna is in transition from one scan strategy to another.

//   TRANSITION_FLAG_AT_CENTER: the beam is flagged as in transition if 
//   the center pulse of the beam has the transition flag set.

//   TRANSITION_FLAG_AT_BOTH_ENDS: the beam is flagged as in transition 
//   if both the start and end pulses of the beam have the transition flag 
//   set.

//   TRANSITION_FLAG_AT_EITHER_END: the beam is flagged as in transition 
//   if either the start or end pulses of the beam have the transition 
//   flag set.

//   TRANSITION_FLAG_MISSING: transition flag is not available.
//
// Type: enum
// Options:
//     TRANSITION_FLAG_AT_CENTER
//     TRANSITION_FLAG_AT_BOTH_ENDS
//     TRANSITION_FLAG_AT_EITHER_END
//     TRANSITION_FLAG_MISSING
//

// transition_method = TRANSITION_FLAG_AT_CENTER;
transition_method = TRANSITION_FLAG_AT_BOTH_ENDS;

