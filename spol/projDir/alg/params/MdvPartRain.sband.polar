/**********************************************************************
 * TDRP params for MdvPartRain
 **********************************************************************/

//======================================================================
//
// MdvPartRain reads in dual polarization data in an MDV polar file, 
//   computes derived fields and writes these out to an MDV file.
//
//======================================================================
 
//======================================================================
//
// DEBUG AND PROCESS CONTROL.
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
//     DEBUG_EXTRA
//

debug = DEBUG_OFF;

///////////// instance ////////////////////////////////
//
// Process instance.
// Used for registration with procmap.
// Type: string
//

instance = "sband";

///////////// mode ////////////////////////////////////
//
// Operating mode.
// In REALTIME mode, the program waits for a new input file. In ARCHIVE 
//   mode, it moves through the data between the start and end times set 
//   on the command line. In FILELIST mode, it moves through the list of 
//   file names specified on the command line.
//
// Type: enum
// Options:
//     ARCHIVE
//     REALTIME
//     FILELIST
//

mode = ARCHIVE;

//======================================================================
//
// DATA INPUT.
//
//======================================================================
 
///////////// input_dir ///////////////////////////////
//
// Directory for input data.
// This is used in REALTIME and ARCHIVE modes only. In FILELIST mode, 
//   the file paths are specified on the command line.
// Type: string
//

input_dir = "$(DATA_DIR)/mdv/radial/moments/sband/sur";

///////////// set_elev_limits /////////////////////////
//
// Option to set elevation limits.
// Type: boolean
//

set_elev_limits = FALSE;

///////////// lower_elev //////////////////////////////
//
// Lower elev limit (deg).
// Type: float
//

lower_elev = 0;

///////////// upper_elev //////////////////////////////
//
// Upper elev limit (deg).
// Type: float
//

upper_elev = 0;

//======================================================================
//
// WAVELENGTH.
//
//======================================================================
 
///////////// override_wavelength /////////////////////
//
// Option to specify the wavelength (cm).
// If FALSE, the wavelength will be obtained from the RADAR chunk in the 
//   MDV file. If TRUE, the wavelength will be set from the parameter 
//   file.
// Type: boolean
//

override_wavelength = FALSE;

///////////// wavelength_cm ///////////////////////////
//
// Wavelength (cm).
// Must be supplied if not in MDV file. See 'override_wavelength'.
// Type: double
//

wavelength_cm = 10;

//======================================================================
//
// RADAR HEIGHT.
//
//======================================================================
 
///////////// override_radar_height ///////////////////
//
// Option to specify the radar height.
// If FALSE, the radar height will be obtained from the RADAR chunk in 
//   the MDV file. If TRUE, the radar height will be set from the 
//   parameter file.
// Type: boolean
//

override_radar_height = FALSE;

///////////// radar_height_km /////////////////////////
//
// Radar height (km msl).
// Must be supplied if not in MDV file. See 'override_radar_height'.
// Type: double
//

radar_height_km = 10;

//======================================================================
//
// INPUT FIELD INFORMATION.
//
// Names of input fields in the Dsr queue.
//
//======================================================================
 
///////////// DBZ_field_name //////////////////////////
//
// Field name for DBZ (ZH) in the input file.
// Type: string
//

DBZ_field_name = "DBZ_F";

///////////// SNR_field_name //////////////////////////
//
// Field name for SNR in the input file.
// Type: string
//

SNR_field_name = "SNRHC";

///////////// ZDR_field_name //////////////////////////
//
// Field name for ZDR in the input file.
// Type: string
//

ZDR_field_name = "ZDR_F";

///////////// LDR_available ///////////////////////////
//
// Is the LDR field available?.
// Type: boolean
//

LDR_available = TRUE;

///////////// LDR_field_name //////////////////////////
//
// Field name for LDR, if available in the input file.
// Type: string
//

LDR_field_name = "LDRH_F";

///////////// PHIDP_field_name ////////////////////////
//
// Field name for PHIDP in the input file.
// Type: string
//

PHIDP_field_name = "PHIDP_F";

///////////// RHOHV_field_name ////////////////////////
//
// Field name for RHOHV in the input file.
// Type: string
//

RHOHV_field_name = "RHOHV_F";

///////////// compute_kdp /////////////////////////////
//
// Option to compute KDP from PHIDP.
// If FALSE, KDP must be available in the input data. See 
//   KDP_field_name.
// Type: boolean
//

compute_kdp = TRUE;

///////////// KDP_field_name //////////////////////////
//
// Field name for KDP in the input file.
// Required if compute_kdp is FALSE.
// Type: string
//

KDP_field_name = "KDP_F";

//======================================================================
//
// OPTION TO COMPUTE SNR from DBZ.
//
//======================================================================
 
///////////// compute_snr_from_dbz ////////////////////
//
// Option to compute the SNR field from the DBZ field.
// If SNR is not available, it can be computed from DBZ, given the noise 
//   DBZ at 100 km.
// Type: boolean
//

compute_snr_from_dbz = FALSE;

///////////// noise_dbz_at_100km //////////////////////
//
// The noise represented as dBZ at 100km range.
// This is used for computing the signal/noise value from the DBZ field.
// Type: double
//

noise_dbz_at_100km = 0;

//======================================================================
//
// SMOOTHING INPUT FIELDS FOR PRECIP AND PID.
//
// DBZ, ZDR, LDR and RHOHV can be somewhat noisy gate-to-gate. This 
//   section gives you the option of smoothing the fields in range by 
//   applying a median filter.
//
//======================================================================
 
///////////// apply_median_filter_to_DBZ //////////////
//
// Option to filter DBZ with median filter.
// The filter is computed in range, and affects both rain rate and PID.
// Type: boolean
//

apply_median_filter_to_DBZ = TRUE;

///////////// DBZ_median_filter_len ///////////////////
//
// Length of median filter for DBZ - gates.
// See 'appply_median_filter_to_DBZ'.
// Type: int
//

DBZ_median_filter_len = 5;

///////////// apply_median_filter_to_ZDR //////////////
//
// Option to filter ZDR with median filter.
// The filter is computed in range, and affects both rain rate and PID.
// Type: boolean
//

apply_median_filter_to_ZDR = TRUE;

///////////// ZDR_median_filter_len ///////////////////
//
// Length of median filter for ZDR - gates.
// See 'appply_median_filter_to_ZDR'.
// Type: int
//

ZDR_median_filter_len = 5;

///////////// apply_median_filter_to_LDR //////////////
//
// Option to filter LDR with median filter.
// The filter is computed in range, and affects PID only.
// Type: boolean
//

apply_median_filter_to_LDR = TRUE;

///////////// LDR_median_filter_len ///////////////////
//
// Length of median filter for LDR - gates.
// See 'appply_median_filter_to_LDR'.
// Type: int
//

LDR_median_filter_len = 5;

///////////// apply_median_filter_to_RHOHV ////////////
//
// Option to filter RHOHV with median filter.
// The filter is computed in range, and affects PID only.
// Type: boolean
//

apply_median_filter_to_RHOHV = TRUE;

///////////// RHOHV_median_filter_len /////////////////
//
// Length of median filter for RHOHV - gates.
// See 'appply_median_filter_to_RHOHV'.
// Type: int
//

RHOHV_median_filter_len = 5;

///////////// ngates_for_sdev /////////////////////////
//
// Number of gates for computing standard deviations.
// This applies to computing the standard deviation of zdr and phidp, 
//   for PID.
// Type: int
//

ngates_for_sdev = 9;

//======================================================================
//
// SMOOTHING FIELDS FOR KDP.
//
// PHIDP can have spikes in it. This section gives you the option of 
//   smoothing the fields in range by applying a median filter before 
//   computing KDP.
//
//======================================================================
 
///////////// apply_median_filter_to_PHIDP ////////////
//
// Option to filter PHIDP with median filter.
// The filter is applied in range.
// Type: boolean
//

apply_median_filter_to_PHIDP = TRUE;

///////////// PHIDP_median_filter_len /////////////////
//
// Length of median filter for PHIDP - gates.
// See 'appply_median_filter_to_PHIDP'.
// Type: int
//

PHIDP_median_filter_len = 5;

//======================================================================
//
// COMPUTING KDP.
//
// Parameters for computing KDP.
//
//======================================================================
 
///////////// KDP_fir_filter_len //////////////////////
//
// Filter length for the FIR filter for PHIDP (gates).
// When computing KDP, an FIR filter is first applied to PHIDP to smooth 
//   it. This is the length of that filter, in gates.
//
// Type: enum
// Options:
//     FIR_LEN_125
//     FIR_LEN_30
//     FIR_LEN_20
//     FIR_LEN_10
//

KDP_fir_filter_len = FIR_LEN_20;

///////////// KDP_phidp_difference_threshold //////////
//
// Sets the threshold for difference of phidp.
// This is used to test the difference between the unfolded phidp value 
//   and the filtered phidp value. If the difference exceeds this value, 
//   we use the original value instead of the filtered value. Applies to 
//   computation of KDP only.
// Type: double
//

KDP_phidp_difference_threshold = 4;

///////////// KDP_phidp_sdev_threshold ////////////////
//
// Sets the threshold for the standard deviation of phidp in range.
// The sdev of phidp is a good test for weather. If the sdev is less 
//   than this value, it is assumed we are in weather. Applies to 
//   computation of KDP only.
// Type: double
//

KDP_phidp_sdev_threshold = 12;

///////////// KDP_zdr_sdev_threshold //////////////////
//
// Sets the threshold for the standard deviation of zdr in range.
// The sdev of zdr is a good test for weather. If the sdev is less than 
//   this value, it is assumed we are in weather. Applies to computation 
//   of KDP only.
// Type: double
//

KDP_zdr_sdev_threshold = 1.8;

///////////// KDP_rhohv_threshold /////////////////////
//
// Sets the threshold for rhohv.
// rhohv is a good test for weather. If rhohv is greater than this 
//   value, it is assumed we are in weather. Applies to computation of KDP 
//   only.
// Type: double
//

KDP_rhohv_threshold = 0.75;

///////////// KDP_constrain_using_dbz /////////////////
//
// Option to constrain KDP to reasonable values using dbz.
// If true, the KDP values will be checked against DBZ, and will be 
//   limited to a reasonable range given the DBZ value.
// Type: boolean
//

KDP_constrain_using_dbz = TRUE;

//======================================================================
//
// CENSORING.
//
//======================================================================
 
///////////// censor_using_thresholds /////////////////
//
// Option to censor the output using set thresholds.
// If TRUE, the thresholding fields will be examined to see if it is 
//   within the desired range. Examples are SNR (Signal-to-noise) and NCP 
//   (normalized coherent power). If the specified field at a gate falls 
//   outside the specified range, all output fields will be set to missing 
//   for that gate.
// Type: boolean
//

censor_using_thresholds = TRUE;

///////////// censor_field_name ///////////////////////
//
// Name of field for thresholding.
// This is the DSR (input) field name for the thresholding field. If 
//   this field is available, it is used for thresholding. If not, 
//   thresholding will not be performed.
// Type: string
//

censor_field_name = "SNRHC_F";

///////////// censor_min_value ////////////////////////
//
// Minimum threshold - see 'censor_output_using_thresholds'.
// The specified field at a gate must exceed this value for the gate to 
//   be accepted.
// Type: double
//

censor_min_value = 3;

///////////// censor_max_value ////////////////////////
//
// Maximum threshold - see 'censor_output_using_thresholds'.
// The specified field at a gate must be less than this value for the 
//   gate to be accepted.
// Type: double
//

censor_max_value = 10000.1;

///////////// min_DBZ_for_KDP_rates ///////////////////
//
// KDP-based rates will be set to 0 for gates with DBZ values below this 
//   threshold.
// KDP can be a noisy field, which can lead to large KDP-based estimates 
//   even in low reflectivity areas. Use of this threshold prevents high 
//   KDP estimates in low reflectivity regions.
// Type: double
//

min_DBZ_for_KDP_rates = 25;

///////////// min_valid_rate //////////////////////////
//
// Minimum valid precip rate (mm/hr).
// If any computed rate is less than this value, it is set to 0.
// Type: double
//

min_valid_rate = 0.1;

//======================================================================
//
// PRECIP COMPUTATIONS.
//
// Coefficients for the precip equations.
//
//======================================================================
 
//======================================================================
//
// PRECIP_RATE_ZH.
//
// RATE_ZH = zh_aa * (ZH ** zh_bb).
//
//======================================================================
 
///////////// zh_aa ///////////////////////////////////
//
// Coefficient for PRECIP_RATE_ZH.
// Type: double
//

zh_aa = 0.027366;

///////////// zh_bb ///////////////////////////////////
//
// Exponent for PRECIP_RATE_ZH.
// Type: double
//

zh_bb = 0.69444;

//======================================================================
//
// PRECIP_RATE_Z_ZDR.
//
// RATE_Z_ZDR = zzdr_aa * (ZH ** zzdr_bb) * (ZDR ** zzdr_cc).
//
//======================================================================
 
///////////// zzdr_aa /////////////////////////////////
//
// Coefficient for PRECIP_RATE_ZZDR.
// Type: double
//

zzdr_aa = 0.00684;

///////////// zzdr_bb /////////////////////////////////
//
// ZH exponent for PRECIP_RATE_ZZDR.
// Type: double
//

zzdr_bb = 1;

///////////// zzdr_cc /////////////////////////////////
//
// ZDR exponent for PRECIP_RATE_ZZDR.
// Type: double
//

zzdr_cc = -4.86;

//======================================================================
//
// PRECIP_RATE_KDP.
//
// RATE_KDP = sign(KDP) * kdp_aa * (|KDP| ** kdp_bb).
//
//======================================================================
 
///////////// kdp_aa //////////////////////////////////
//
// Coefficient for PRECIP_RATE_KDP.
// Type: double
//

kdp_aa = 40.6;

///////////// kdp_bb //////////////////////////////////
//
// Exponent for PRECIP_RATE_KDP.
// Type: double
//

kdp_bb = 0.866;

///////////// precip_constrain_kdp_using_dbz //////////
//
// For precip, constrain KDP to reasonable values using dbz.
// If true, the KDP values will be checked against DBZ, and will be 
//   limited to a reasonable range given the DBZ value.
// Type: boolean
//

precip_constrain_kdp_using_dbz = FALSE;

///////////// precip_constrain_zdr_using_dbz //////////
//
// For precip, constrain ZDR to reasonable values using dbz.
// If true, the ZDR values will be checked against DBZ, and will be 
//   limited to a reasonable range given the DBZ value.
// Type: boolean
//

precip_constrain_zdr_using_dbz = FALSE;

//======================================================================
//
// PRECIP_RATE_KDP_ZDR.
//
// RATE_KDP_ZDR = sign(KDP) * kdpzdr_aa * (|KDP| ** kdpzdr_bb) * (ZDR ** 
//   kdpzdr_cc).
//
//======================================================================
 
///////////// kdpzdr_aa ///////////////////////////////
//
// Coefficient for PRECIP_RATE_KDP_ZDR.
// Type: double
//

kdpzdr_aa = 136;

///////////// kdpzdr_bb ///////////////////////////////
//
// KDP exponent for PRECIP_RATE_KDP_ZDR.
// Type: double
//

kdpzdr_bb = 0.968;

///////////// kdpzdr_cc ///////////////////////////////
//
// ZDR exponent for PRECIP_RATE_KDP_ZDR.
// Type: double
//

kdpzdr_cc = -2.86;

//======================================================================
//
// PRECIP_RATE_HYBRID.
//
// The HYBRID rate is a combination of the other rates.
//
//======================================================================
 
///////////// hybrid_aa ///////////////////////////////
//
// If RATE_ZH <= hybrid_aa, RATE_HYBRID = RATE_ZH.
// Type: double
//

hybrid_aa = 10;

///////////// hybrid_bb ///////////////////////////////
//
// Else if RATE_Z_ZDR <= hybrid_bb, RATE_HYBRID = RATE_Z_ZDR.
// Type: double
//

hybrid_bb = 50;

///////////// hybrid_cc ///////////////////////////////
//
// Else If RATE_Z_ZDR <= hybrid_cc, RATE_HYBRID = RATE_KDP_ZDR.
// Else if RATE_Z_ZDR > hybrid_bb, RATE_HYBRID = RATE_KDP.
// Type: double
//

hybrid_cc = 100;

//======================================================================
//
// PARTICLE ID COMPUTATIONS - PID.
//
//======================================================================
 
///////////// compute_pid /////////////////////////////
//
// Option to compute particle ID.
// Type: boolean
//

compute_pid = TRUE;

///////////// pid_thresholds_file_path ////////////////
//
// File path for fuzzy logic thresholds for PID.
// This file contains the thresholds and weights for computing particle 
//   ID.
// Type: string
//

pid_thresholds_file_path = "$(PROJ_DIR)/alg/params/pid_thresholds.sband";

///////////// PID_min_valid_interest //////////////////
//
// Minimum valid interest value for identifying a particle.
// If the computed interest value is below this, the PID is set to 
//   missing.
// Type: double
//

PID_min_valid_interest = 0.5;

///////////// PID_constrain_kdp_using_dbz /////////////
//
// For PID, constrain KDP to reasonable values using dbz.
// If true, the KDP values will be checked against DBZ, and will be 
//   limited to a reasonable range given the DBZ value.
// Type: boolean
//

PID_constrain_kdp_using_dbz = FALSE;

//======================================================================
//
// SOUNDING INPUT FOR PID temperatures - OPTIONAL.
//
//======================================================================
 
///////////// use_soundings_from_spdb /////////////////
//
// Option to read sounding data from SPDB.
// If TRUE, the program will read the closest (in time) available 
//   sounding from an SPDB data base. The temperature profile from the 
//   sounding will be used to override the temperature profile in the PID 
//   thresholds config file.
// Type: boolean
//

use_soundings_from_spdb = TRUE;

///////////// sounding_spdb_url ///////////////////////
//
// SPDB URL for sounding data.
// Type: string
//

sounding_spdb_url = "spdbp:://localhost::spdb/soundings/gan";

///////////// sounding_search_time_margin_secs ////////
//
// Time margin for retrieving sounding, in secs.
// This is the total size of the output FMQ buffer. Some of this buffer 
//   will be used for control bytes (12 bytes per message).
// Type: int
//

sounding_search_time_margin_secs = 86400;

///////////// sounding_required_pressure_range_hpa ////
//
// Required pressure range for sounding to be valid (hPa).
// This is used to provide a quality check on the sounding. If the 
//   pressure data does not fully cover this range, the sounding is 
//   rejected and we look back for the next available one.
//
// Type: struct
//   typedef struct {
//      double min_val;
//      double max_val;
//   }
//
//

sounding_required_pressure_range_hpa = {
    min_val = 300,
    max_val = 950
};

///////////// sounding_required_height_range_m ////////
//
// Required height range for sounding to be valid (m).
// This is used to provide a quality check on the sounding. If the 
//   height data does not fully cover this range, the sounding is rejected 
//   and we look back for the next available one.
//
// Type: struct
//   typedef struct {
//      double min_val;
//      double max_val;
//   }
//
//

sounding_required_height_range_m = {
    min_val = 500,
    max_val = 15000
};

///////////// sounding_check_pressure_monotonically_decreasing 
//
// Option to check that pressure decreases monotonically.
// If TRUE, we will check that pressure decreases monotonically. If not, 
//   the sounding is rejected and we look back for the next available one.
// Type: boolean
//

sounding_check_pressure_monotonically_decreasing = TRUE;

//======================================================================
//
// SMOOTHING OUTPUT PID.
//
// This section gives you the option of smoothing the output pid field 
//   in range by applying a median filter.
//
//======================================================================
 
///////////// apply_median_filter_to_PID //////////////
//
// Option to filter PID with median filter.
// The filter is computed in range, and affects both rain rate and PID.
// Type: boolean
//

apply_median_filter_to_PID = FALSE;

///////////// PID_median_filter_len ///////////////////
//
// Length of median filter for PID - gates.
// See 'appply_median_filter_to_PID'.
// Type: int
//

PID_median_filter_len = 7;

//======================================================================
//
// DATA OUTPUT.
//
//======================================================================
 
///////////// output_url //////////////////////////////
//
// Output URL.
// Output MDV data is written to this URL.
// Type: string
//

output_url = "$(DATA_DIR)/mdv/radial/partrain/sband/sur_2";

//======================================================================
//
// KDP FIELDS.
//
//======================================================================
 
///////////// KDP_output_field ////////////////////////
//
// If write is TRUE, KDP is included in the output MDV file.
//
// Type: struct
//   typedef struct {
//      string name;
//      string long_name;
//      string units;
//      encoding_type_t encoding;
//        Options:
//          ENCODING_ASIS
//          ENCODING_INT8
//          ENCODING_INT16
//          ENCODING_FLOAT32
//      boolean write;
//   }
//
//

KDP_output_field = {
    name = "KDP",
    long_name = "KDP",
    units = "deg/km",
    encoding = ENCODING_INT16,
    write = TRUE
};

///////////// DBZ_FOR_KDP_output_field ////////////////
//
// If write is TRUE, the DBZ used by the kdp algorithm is included in 
//   the output MDV file.
//
// Type: struct
//   typedef struct {
//      string name;
//      string long_name;
//      string units;
//      encoding_type_t encoding;
//        Options:
//          ENCODING_ASIS
//          ENCODING_INT8
//          ENCODING_INT16
//          ENCODING_FLOAT32
//      boolean write;
//   }
//
//

DBZ_FOR_KDP_output_field = {
    name = "DBZ_FOR_KDP",
    long_name = "DBZ_used_FOR_KDP_comps",
    units = "deg",
    encoding = ENCODING_INT16,
    write = FALSE
};

///////////// SNR_FOR_KDP_output_field ////////////////
//
// If write is TRUE, the SNR used by the kdp algorithm is included in 
//   the output MDV file.
//
// Type: struct
//   typedef struct {
//      string name;
//      string long_name;
//      string units;
//      encoding_type_t encoding;
//        Options:
//          ENCODING_ASIS
//          ENCODING_INT8
//          ENCODING_INT16
//          ENCODING_FLOAT32
//      boolean write;
//   }
//
//

SNR_FOR_KDP_output_field = {
    name = "SNR_FOR_KDP",
    long_name = "SNR_used_FOR_KDP_comps",
    units = "deg",
    encoding = ENCODING_INT16,
    write = FALSE
};

///////////// ZDR_FOR_KDP_output_field ////////////////
//
// If write is TRUE, the ZDR used by the kdp algorithm is included in 
//   the output MDV file.
//
// Type: struct
//   typedef struct {
//      string name;
//      string long_name;
//      string units;
//      encoding_type_t encoding;
//        Options:
//          ENCODING_ASIS
//          ENCODING_INT8
//          ENCODING_INT16
//          ENCODING_FLOAT32
//      boolean write;
//   }
//
//

ZDR_FOR_KDP_output_field = {
    name = "ZDR_FOR_KDP",
    long_name = "ZDR_used_FOR_KDP_comps",
    units = "deg",
    encoding = ENCODING_INT16,
    write = FALSE
};

///////////// RHOHV_FOR_KDP_output_field //////////////
//
// If write is TRUE, the RHOHV used by the kdp algorithm is included in 
//   the output MDV file.
//
// Type: struct
//   typedef struct {
//      string name;
//      string long_name;
//      string units;
//      encoding_type_t encoding;
//        Options:
//          ENCODING_ASIS
//          ENCODING_INT8
//          ENCODING_INT16
//          ENCODING_FLOAT32
//      boolean write;
//   }
//
//

RHOHV_FOR_KDP_output_field = {
    name = "RHOHV_FOR_KDP",
    long_name = "RHOHV_used_FOR_KDP_comps",
    units = "deg",
    encoding = ENCODING_INT16,
    write = FALSE
};

///////////// PHIDP_FOR_KDP_output_field //////////////
//
// If write is TRUE, the PHIDP used by the kdp algorithm is included in 
//   the output MDV file.
//
// Type: struct
//   typedef struct {
//      string name;
//      string long_name;
//      string units;
//      encoding_type_t encoding;
//        Options:
//          ENCODING_ASIS
//          ENCODING_INT8
//          ENCODING_INT16
//          ENCODING_FLOAT32
//      boolean write;
//   }
//
//

PHIDP_FOR_KDP_output_field = {
    name = "PHIDP_FOR_KDP",
    long_name = "PHIDP_used_FOR_KDP_comps",
    units = "deg",
    encoding = ENCODING_INT16,
    write = FALSE
};

///////////// SDPHIDP_FOR_KDP_output_field ////////////
//
// If write is TRUE, the SDPHIDP used by the kdp algorithm is included 
//   in the output MDV file.
//
// Type: struct
//   typedef struct {
//      string name;
//      string long_name;
//      string units;
//      encoding_type_t encoding;
//        Options:
//          ENCODING_ASIS
//          ENCODING_INT8
//          ENCODING_INT16
//          ENCODING_FLOAT32
//      boolean write;
//   }
//
//

SDPHIDP_FOR_KDP_output_field = {
    name = "SDPHIDP_FOR_KDP",
    long_name = "SDPHIDP_used_FOR_KDP_comps",
    units = "deg",
    encoding = ENCODING_INT16,
    write = FALSE
};

//======================================================================
//
// PRECIP FIELDS.
//
//======================================================================
 
///////////// RATE_ZH_output_field ////////////////////
//
// If write is TRUE, the precip rate from ZH is included in the output 
//   MDV file.
//
// Type: struct
//   typedef struct {
//      string name;
//      string long_name;
//      string units;
//      encoding_type_t encoding;
//        Options:
//          ENCODING_ASIS
//          ENCODING_INT8
//          ENCODING_INT16
//          ENCODING_FLOAT32
//      boolean write;
//   }
//
//

RATE_ZH_output_field = {
    name = "RATE_ZH",
    long_name = "Precip rate ZH",
    units = "mm/hr",
    encoding = ENCODING_INT16,
    write = TRUE
};

///////////// RATE_Z_ZDR_output_field /////////////////
//
// If write is TRUE, the precip rate from Z_ZDR is included in the 
//   output MDV file.
//
// Type: struct
//   typedef struct {
//      string name;
//      string long_name;
//      string units;
//      encoding_type_t encoding;
//        Options:
//          ENCODING_ASIS
//          ENCODING_INT8
//          ENCODING_INT16
//          ENCODING_FLOAT32
//      boolean write;
//   }
//
//

RATE_Z_ZDR_output_field = {
    name = "RATE_Z_ZDR",
    long_name = "Precip rate Z_ZDR",
    units = "mm/hr",
    encoding = ENCODING_INT16,
    write = TRUE
};

///////////// RATE_KDP_output_field ///////////////////
//
// If write is TRUE, the precip rate from KDP is included in the output 
//   MDV file.
//
// Type: struct
//   typedef struct {
//      string name;
//      string long_name;
//      string units;
//      encoding_type_t encoding;
//        Options:
//          ENCODING_ASIS
//          ENCODING_INT8
//          ENCODING_INT16
//          ENCODING_FLOAT32
//      boolean write;
//   }
//
//

RATE_KDP_output_field = {
    name = "RATE_KDP",
    long_name = "Precip rate KDP",
    units = "mm/hr",
    encoding = ENCODING_INT16,
    write = TRUE
};

///////////// RATE_KDP_ZDR_output_field ///////////////
//
// If write is TRUE, the precip rate from KDP_ZDR is included in the 
//   output MDV file.
//
// Type: struct
//   typedef struct {
//      string name;
//      string long_name;
//      string units;
//      encoding_type_t encoding;
//        Options:
//          ENCODING_ASIS
//          ENCODING_INT8
//          ENCODING_INT16
//          ENCODING_FLOAT32
//      boolean write;
//   }
//
//

RATE_KDP_ZDR_output_field = {
    name = "RATE_KDP_ZDR",
    long_name = "Precip rate KDP_ZDR",
    units = "mm/hr",
    encoding = ENCODING_INT16,
    write = TRUE
};

///////////// RATE_HYBRID_output_field ////////////////
//
// If write is TRUE, the HYBRID field is included in the output MDV 
//   file.
//
// Type: struct
//   typedef struct {
//      string name;
//      string long_name;
//      string units;
//      encoding_type_t encoding;
//        Options:
//          ENCODING_ASIS
//          ENCODING_INT8
//          ENCODING_INT16
//          ENCODING_FLOAT32
//      boolean write;
//   }
//
//

RATE_HYBRID_output_field = {
    name = "RATE_HYBRID",
    long_name = "Precip rate HYBRID",
    units = "mm/hr",
    encoding = ENCODING_INT16,
    write = TRUE
};

///////////// DBZ_FOR_RATE_output_field ///////////////
//
// If write is TRUE, the DBZ used by the rate algorithm is included in 
//   the output MDV file.
//
// Type: struct
//   typedef struct {
//      string name;
//      string long_name;
//      string units;
//      encoding_type_t encoding;
//        Options:
//          ENCODING_ASIS
//          ENCODING_INT8
//          ENCODING_INT16
//          ENCODING_FLOAT32
//      boolean write;
//   }
//
//

DBZ_FOR_RATE_output_field = {
    name = "DBZ_FOR_RATE",
    long_name = "DBZ_used_FOR_RATE_comps",
    units = "dBZ",
    encoding = ENCODING_INT16,
    write = FALSE
};

///////////// ZDR_FOR_RATE_output_field ///////////////
//
// If write is TRUE, the ZDR used by the rate algorithm is included in 
//   the output MDV file.
//
// Type: struct
//   typedef struct {
//      string name;
//      string long_name;
//      string units;
//      encoding_type_t encoding;
//        Options:
//          ENCODING_ASIS
//          ENCODING_INT8
//          ENCODING_INT16
//          ENCODING_FLOAT32
//      boolean write;
//   }
//
//

ZDR_FOR_RATE_output_field = {
    name = "ZDR_FOR_RATE",
    long_name = "ZDR_used_FOR_RATE_comps",
    units = "dB",
    encoding = ENCODING_INT16,
    write = FALSE
};

///////////// KDP_FOR_RATE_output_field ///////////////
//
// If write is TRUE, the KDP used by the rate algorithm is included in 
//   the output MDV file.
//
// Type: struct
//   typedef struct {
//      string name;
//      string long_name;
//      string units;
//      encoding_type_t encoding;
//        Options:
//          ENCODING_ASIS
//          ENCODING_INT8
//          ENCODING_INT16
//          ENCODING_FLOAT32
//      boolean write;
//   }
//
//

KDP_FOR_RATE_output_field = {
    name = "KDP_FOR_RATE",
    long_name = "KDP_used_FOR_RATE_comps",
    units = "deg/km",
    encoding = ENCODING_INT16,
    write = FALSE
};

//======================================================================
//
// PARTICLE ID FIELDS.
//
//======================================================================
 
///////////// PID_output_field ////////////////////////
//
// If write is TRUE, PID is included in the output MDV file.
//
// Type: struct
//   typedef struct {
//      string name;
//      string long_name;
//      string units;
//      encoding_type_t encoding;
//        Options:
//          ENCODING_ASIS
//          ENCODING_INT8
//          ENCODING_INT16
//          ENCODING_FLOAT32
//      boolean write;
//   }
//
//

PID_output_field = {
    name = "PID",
    long_name = "Particle ID",
    units = "",
    encoding = ENCODING_INT8,
    write = TRUE
};

///////////// PID_INT_output_field ////////////////////
//
// If write is TRUE, interest for most likely PID is included in the 
//   output MDV file.
//
// Type: struct
//   typedef struct {
//      string name;
//      string long_name;
//      string units;
//      encoding_type_t encoding;
//        Options:
//          ENCODING_ASIS
//          ENCODING_INT8
//          ENCODING_INT16
//          ENCODING_FLOAT32
//      boolean write;
//   }
//
//

PID_INT_output_field = {
    name = "PidInterest",
    long_name = "PID interest",
    units = "",
    encoding = ENCODING_INT16,
    write = FALSE
};

///////////// PID2_output_field ///////////////////////
//
// If write is TRUE, second most likely PID is included in the output 
//   MDV file.
//
// Type: struct
//   typedef struct {
//      string name;
//      string long_name;
//      string units;
//      encoding_type_t encoding;
//        Options:
//          ENCODING_ASIS
//          ENCODING_INT8
//          ENCODING_INT16
//          ENCODING_FLOAT32
//      boolean write;
//   }
//
//

PID2_output_field = {
    name = "PID2",
    long_name = "Particle ID2",
    units = "",
    encoding = ENCODING_INT8,
    write = FALSE
};

///////////// PID_INT2_output_field ///////////////////
//
// If write is TRUE, interest for second most likely PID is included in 
//   the output MDV file.
//
// Type: struct
//   typedef struct {
//      string name;
//      string long_name;
//      string units;
//      encoding_type_t encoding;
//        Options:
//          ENCODING_ASIS
//          ENCODING_INT8
//          ENCODING_INT16
//          ENCODING_FLOAT32
//      boolean write;
//   }
//
//

PID_INT2_output_field = {
    name = "PidInterest2",
    long_name = "PID interest 2",
    units = "",
    encoding = ENCODING_INT16,
    write = FALSE
};

///////////// PID_CONFIDENCE_output_field /////////////
//
// If write is TRUE, confidence in PID is included in the output MDV 
//   file.
//
// Type: struct
//   typedef struct {
//      string name;
//      string long_name;
//      string units;
//      encoding_type_t encoding;
//        Options:
//          ENCODING_ASIS
//          ENCODING_INT8
//          ENCODING_INT16
//          ENCODING_FLOAT32
//      boolean write;
//   }
//
//

PID_CONFIDENCE_output_field = {
    name = "PidConfidence",
    long_name = "PID confidence",
    units = "",
    encoding = ENCODING_INT16,
    write = FALSE
};

///////////// DBZ_FOR_PID_output_field ////////////////
//
// If write is TRUE, the DBZ used by the pid algorithm is included in 
//   the output MDV file.
//
// Type: struct
//   typedef struct {
//      string name;
//      string long_name;
//      string units;
//      encoding_type_t encoding;
//        Options:
//          ENCODING_ASIS
//          ENCODING_INT8
//          ENCODING_INT16
//          ENCODING_FLOAT32
//      boolean write;
//   }
//
//

DBZ_FOR_PID_output_field = {
    name = "DBZ_FOR_PID",
    long_name = "DBZ_used_FOR_PID_comps",
    units = "dBZ",
    encoding = ENCODING_INT16,
    write = FALSE
};

///////////// ZDR_FOR_PID_output_field ////////////////
//
// If write is TRUE, the ZDR used by the pid algorithm is included in 
//   the output MDV file.
//
// Type: struct
//   typedef struct {
//      string name;
//      string long_name;
//      string units;
//      encoding_type_t encoding;
//        Options:
//          ENCODING_ASIS
//          ENCODING_INT8
//          ENCODING_INT16
//          ENCODING_FLOAT32
//      boolean write;
//   }
//
//

ZDR_FOR_PID_output_field = {
    name = "ZDR_FOR_PID",
    long_name = "ZDR_used_FOR_PID_comps",
    units = "dB",
    encoding = ENCODING_INT16,
    write = FALSE
};

///////////// LDR_FOR_PID_output_field ////////////////
//
// If write is TRUE, the LDR used by the pid algorithm is included in 
//   the output MDV file.
//
// Type: struct
//   typedef struct {
//      string name;
//      string long_name;
//      string units;
//      encoding_type_t encoding;
//        Options:
//          ENCODING_ASIS
//          ENCODING_INT8
//          ENCODING_INT16
//          ENCODING_FLOAT32
//      boolean write;
//   }
//
//

LDR_FOR_PID_output_field = {
    name = "LDR_FOR_PID",
    long_name = "LDR_used_FOR_PID_comps",
    units = "dB",
    encoding = ENCODING_INT16,
    write = FALSE
};

///////////// PHIDP_FOR_PID_output_field //////////////
//
// If write is TRUE, the PHIDP used by the pid algorithm is included in 
//   the output MDV file.
//
// Type: struct
//   typedef struct {
//      string name;
//      string long_name;
//      string units;
//      encoding_type_t encoding;
//        Options:
//          ENCODING_ASIS
//          ENCODING_INT8
//          ENCODING_INT16
//          ENCODING_FLOAT32
//      boolean write;
//   }
//
//

PHIDP_FOR_PID_output_field = {
    name = "PHIDP_FOR_PID",
    long_name = "PHIDP_used_FOR_PID_comps",
    units = "deg",
    encoding = ENCODING_INT16,
    write = FALSE
};

///////////// RHOHV_FOR_PID_output_field //////////////
//
// If write is TRUE, the RHOHV used by the pid algorithm is included in 
//   the output MDV file.
//
// Type: struct
//   typedef struct {
//      string name;
//      string long_name;
//      string units;
//      encoding_type_t encoding;
//        Options:
//          ENCODING_ASIS
//          ENCODING_INT8
//          ENCODING_INT16
//          ENCODING_FLOAT32
//      boolean write;
//   }
//
//

RHOHV_FOR_PID_output_field = {
    name = "RHOHV_FOR_PID",
    long_name = "RHOHV_used_FOR_PID_comps",
    units = "",
    encoding = ENCODING_INT16,
    write = FALSE
};

///////////// KDP_FOR_PID_output_field ////////////////
//
// If write is TRUE, the KDP used by the pid algorithm is included in 
//   the output MDV file.
//
// Type: struct
//   typedef struct {
//      string name;
//      string long_name;
//      string units;
//      encoding_type_t encoding;
//        Options:
//          ENCODING_ASIS
//          ENCODING_INT8
//          ENCODING_INT16
//          ENCODING_FLOAT32
//      boolean write;
//   }
//
//

KDP_FOR_PID_output_field = {
    name = "KDP_FOR_PID",
    long_name = "KDP_used_FOR_PID_comps",
    units = "deg/km",
    encoding = ENCODING_INT16,
    write = FALSE
};

///////////// SDZDR_FOR_PID_output_field //////////////
//
// If write is TRUE, the SDZDR used by the pid algorithm is included in 
//   the output MDV file.
//
// Type: struct
//   typedef struct {
//      string name;
//      string long_name;
//      string units;
//      encoding_type_t encoding;
//        Options:
//          ENCODING_ASIS
//          ENCODING_INT8
//          ENCODING_INT16
//          ENCODING_FLOAT32
//      boolean write;
//   }
//
//

SDZDR_FOR_PID_output_field = {
    name = "SDZDR_FOR_PID",
    long_name = "SDZDR_used_FOR_PID_comps",
    units = "dB",
    encoding = ENCODING_INT16,
    write = FALSE
};

///////////// SDPHIDP_FOR_PID_output_field ////////////
//
// If write is TRUE, the SDPHIDP used by the pid algorithm is included 
//   in the output MDV file.
//
// Type: struct
//   typedef struct {
//      string name;
//      string long_name;
//      string units;
//      encoding_type_t encoding;
//        Options:
//          ENCODING_ASIS
//          ENCODING_INT8
//          ENCODING_INT16
//          ENCODING_FLOAT32
//      boolean write;
//   }
//
//

SDPHIDP_FOR_PID_output_field = {
    name = "SDPHIDP_FOR_PID",
    long_name = "SDPHIDP_used_FOR_PID_comps",
    units = "deg",
    encoding = ENCODING_INT16,
    write = FALSE
};

///////////// TEMP_FOR_PID_output_field ///////////////
//
// If write is TRUE, PID temperature is included in the output MDV file.
//
// Type: struct
//   typedef struct {
//      string name;
//      string long_name;
//      string units;
//      encoding_type_t encoding;
//        Options:
//          ENCODING_ASIS
//          ENCODING_INT8
//          ENCODING_INT16
//          ENCODING_FLOAT32
//      boolean write;
//   }
//
//

TEMP_FOR_PID_output_field = {
    name = "TEMP_FOR_PID",
    long_name = "PID temperature",
    units = "C",
    encoding = ENCODING_INT16,
    write = TRUE
};

///////////// output_particle_interest_fields /////////
//
// Option to output the individual interest fields.
// If TRUE, the interest field for each particle type will be written to 
//   the output FMQ, in addition to the list in 'output_fields'.
// Type: boolean
//

output_particle_interest_fields = FALSE;

///////////// encoding_for_particle_interest_fields ///
//
// Encoding type for interest fields.
//
// Type: enum
// Options:
//     ENCODING_ASIS
//     ENCODING_INT8
//     ENCODING_INT16
//     ENCODING_FLOAT32
//

encoding_for_particle_interest_fields = ENCODING_INT8;

//======================================================================
//
// ECHO INPUT FIELDS.
//
//======================================================================
 
///////////// echo_input_fields_in_output_file ////////
//
// Option to copy some of the input fields into the output file.
// If TRUE, the listed fields will be copied to the output MDV file. See 
//   'echo_field_names'.
// Type: boolean
//

echo_input_fields_in_output_file = FALSE;

///////////// echo_field_names ////////////////////////
//
// List of field names to be copied from the input file to the output 
//   file.
// See 'echo_input_fields_in_output_file'.
// Type: string
// 1D array - variable length.
//

echo_field_names = {
 "KDP_F"
};

