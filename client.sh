#!/usr/bin/env bash

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# !
# ! Note:
# !
# ! THIS SCRIPT HAS BEEN AUTOMATICALLY GENERATED USING
# ! swagger-codegen (https://github.com/swagger-api/swagger-codegen)
# ! FROM SWAGGER SPECIFICATION IN JSON.
# !
# ! Generated on: 2017-04-18T15:28:42.746Z
# !
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

#
# This is a Bash client for Switch Database REST API.
#
# LICENSE:
# 
#
# CONTACT:
# 
#
# MORE INFORMATION:
# 
#

###############################################################################
#
# Make sure Bash is at least in version 4.3
#
###############################################################################
if ! ( (("${BASH_VERSION:0:1}" == "4")) && (("${BASH_VERSION:2:1}" >= "3")) ) \
  && ! (("${BASH_VERSION:0:1}" >= "5")); then
    echo ""
    echo "Sorry - your Bash version is ${BASH_VERSION}"
    echo ""
    echo "You need at least Bash 4.3 to run this script."
    echo ""
    exit 1
fi

###############################################################################
#
# Global variables
#
###############################################################################

##
# The filename of this script for help messages
script_name=`basename "$0"`

##
# Map for headers passed after operation as KEY:VALUE
declare -A header_arguments


##
# Map for operation parameters passed after operation as PARAMETER=VALUE
# These will be mapped to appropriate path or query parameters
# The values in operation_parameters are arrays, so that multiple values
# can be provided for the same parameter if allowed by API specification
declare -A operation_parameters

##
# This array stores the minimum number of required occurences for parameter
# 0 - optional
# 1 - required
declare -A operation_parameters_minimum_occurences
operation_parameters_minimum_occurences["tokenGet:::APIKey"]=1
operation_parameters_minimum_occurences["tokenGet:::Signature"]=1
operation_parameters_minimum_occurences["tokenGet:::Expire"]=1
operation_parameters_minimum_occurences["addPost:::APIKey"]=1
operation_parameters_minimum_occurences["addPost:::AccessToken"]=1
operation_parameters_minimum_occurences["addPost:::List"]=1
operation_parameters_minimum_occurences["addPost:::Body"]=1
operation_parameters_minimum_occurences["listPost:::APIKey"]=1
operation_parameters_minimum_occurences["listPost:::AccessToken"]=1
operation_parameters_minimum_occurences["listPost:::List"]=1
operation_parameters_minimum_occurences["listPost:::Body"]=1
operation_parameters_minimum_occurences["setDelete:::APIKey"]=1
operation_parameters_minimum_occurences["setDelete:::AccessToken"]=1
operation_parameters_minimum_occurences["setDelete:::List"]=1
operation_parameters_minimum_occurences["setDelete:::ListItemId"]=1
operation_parameters_minimum_occurences["setPost:::APIKey"]=1
operation_parameters_minimum_occurences["setPost:::AccessToken"]=1
operation_parameters_minimum_occurences["setPost:::List"]=1
operation_parameters_minimum_occurences["setPost:::ListItemId"]=1
operation_parameters_minimum_occurences["setPost:::Body"]=1

##
# This array stores the maximum number of allowed occurences for parameter
# 1 - single value
# 2 - 2 values
# N - N values
# 0 - unlimited
declare -A operation_parameters_maximum_occurences
operation_parameters_maximum_occurences["tokenGet:::APIKey"]=0
operation_parameters_maximum_occurences["tokenGet:::Signature"]=0
operation_parameters_maximum_occurences["tokenGet:::Expire"]=0
operation_parameters_maximum_occurences["addPost:::APIKey"]=0
operation_parameters_maximum_occurences["addPost:::AccessToken"]=0
operation_parameters_maximum_occurences["addPost:::List"]=0
operation_parameters_maximum_occurences["addPost:::Body"]=0
operation_parameters_maximum_occurences["listPost:::APIKey"]=0
operation_parameters_maximum_occurences["listPost:::AccessToken"]=0
operation_parameters_maximum_occurences["listPost:::List"]=0
operation_parameters_maximum_occurences["listPost:::Body"]=0
operation_parameters_maximum_occurences["setDelete:::APIKey"]=0
operation_parameters_maximum_occurences["setDelete:::AccessToken"]=0
operation_parameters_maximum_occurences["setDelete:::List"]=0
operation_parameters_maximum_occurences["setDelete:::ListItemId"]=0
operation_parameters_maximum_occurences["setPost:::APIKey"]=0
operation_parameters_maximum_occurences["setPost:::AccessToken"]=0
operation_parameters_maximum_occurences["setPost:::List"]=0
operation_parameters_maximum_occurences["setPost:::ListItemId"]=0
operation_parameters_maximum_occurences["setPost:::Body"]=0

##
# The type of collection for specifying multiple values for parameter:
# - multi, csv, ssv, tsv
declare -A operation_parameters_collection_type
operation_parameters_collection_type["tokenGet:::APIKey"]=""
operation_parameters_collection_type["tokenGet:::Signature"]=""
operation_parameters_collection_type["tokenGet:::Expire"]=""
operation_parameters_collection_type["addPost:::APIKey"]=""
operation_parameters_collection_type["addPost:::AccessToken"]=""
operation_parameters_collection_type["addPost:::List"]=""
operation_parameters_collection_type["addPost:::Body"]=""
operation_parameters_collection_type["listPost:::APIKey"]=""
operation_parameters_collection_type["listPost:::AccessToken"]=""
operation_parameters_collection_type["listPost:::List"]=""
operation_parameters_collection_type["listPost:::Body"]=""
operation_parameters_collection_type["setDelete:::APIKey"]=""
operation_parameters_collection_type["setDelete:::AccessToken"]=""
operation_parameters_collection_type["setDelete:::List"]=""
operation_parameters_collection_type["setDelete:::ListItemId"]=""
operation_parameters_collection_type["setPost:::APIKey"]=""
operation_parameters_collection_type["setPost:::AccessToken"]=""
operation_parameters_collection_type["setPost:::List"]=""
operation_parameters_collection_type["setPost:::ListItemId"]=""
operation_parameters_collection_type["setPost:::Body"]=""


##
# Map for body parameters passed after operation as
# PARAMETER==STRING_VALUE or PARAMETER:=NUMERIC_VALUE
# These will be mapped to top level json keys ( { "PARAMETER": "VALUE" })
declare -A body_parameters

##
# These arguments will be directly passed to cURL
curl_arguments=""

##
# The host for making the request
host=""

##
# The user credentials for basic authentication
basic_auth_credential=""

##
# The user API key
apikey_auth_credential=""

##
# If true, the script will only output the actual cURL command that would be
# used
print_curl=false

##
# The operation ID passed on the command line
operation=""

##
# The provided Accept header value
header_accept=""

##
# The provided Content-type header value
header_content_type=""

##
# If there is any body content on the stdin pass it to the body of the request
body_content_temp_file=""

##
# If this variable is set to true, the request will be performed even
# if parameters for required query, header or body values are not provided
# (path parameters are still required).
force=false

##
# Declare some mime types abbreviations for easier content-type and accepts
# headers specification
declare -A mime_type_abbreviations
# text/*
mime_type_abbreviations["text"]="text/plain"
mime_type_abbreviations["html"]="text/html"
mime_type_abbreviations["md"]="text/x-markdown"
mime_type_abbreviations["csv"]="text/csv"
mime_type_abbreviations["css"]="text/css"
mime_type_abbreviations["rtf"]="text/rtf"
# application/*
mime_type_abbreviations["json"]="application/json"
mime_type_abbreviations["xml"]="application/xml"
mime_type_abbreviations["yaml"]="application/yaml"
mime_type_abbreviations["js"]="application/javascript"
mime_type_abbreviations["bin"]="application/octet-stream"
mime_type_abbreviations["rdf"]="application/rdf+xml"
# image/*
mime_type_abbreviations["jpg"]="image/jpeg"
mime_type_abbreviations["png"]="image/png"
mime_type_abbreviations["gif"]="image/gif"
mime_type_abbreviations["bmp"]="image/bmp"
mime_type_abbreviations["tiff"]="image/tiff"


##############################################################################
#
# Escape special URL characters
# Based on table at http://www.w3schools.com/tags/ref_urlencode.asp
#
##############################################################################
url_escape() {
    local raw_url="$1"

    value=$(sed -e 's/ /%20/g' \
       -e 's/!/%21/g' \
       -e 's/"/%22/g' \
       -e 's/#/%23/g' \
       -e 's/\&/%26/g' \
       -e 's/'\''/%28/g' \
       -e 's/(/%28/g' \
       -e 's/)/%29/g' \
       -e 's/:/%3A/g' \
       -e 's/?/%3F/g' <<<$raw_url);

    echo $value
}

##############################################################################
#
# Lookup the mime type abbreviation in the mime_type_abbreviations array.
# If not present assume the user provided a valid mime type
#
##############################################################################
lookup_mime_type() {
    local mime_type=$1

    if [[ ${mime_type_abbreviations[$mime_type]} ]]; then
        echo ${mime_type_abbreviations[$mime_type]}
    else
        echo $1
    fi
}

##############################################################################
#
# Converts an associative array into a list of cURL header
# arguments (-H "KEY: VALUE")
#
##############################################################################
header_arguments_to_curl() {
    local headers_curl=""
    local api_key_header=""
    local api_key_header_in_cli=""

    for key in "${!header_arguments[@]}"; do
        headers_curl+="-H \"${key}: ${header_arguments[${key}]}\" "
        if [[ "${key}XX" == "${api_key_header}XX" ]]; then
            api_key_header_in_cli="YES"
        fi
    done
    headers_curl+=" "

    echo "${headers_curl}"
}

##############################################################################
#
# Converts an associative array into a simple JSON with keys as top
# level object attributes
#
# \todo Add convertion of more complex attributes using paths
#
##############################################################################
body_parameters_to_json() {
    local body_json="-d '{"
    local body_parameter_count=${#body_parameters[@]}
    local count=0
    for key in "${!body_parameters[@]}"; do
        body_json+="\"${key}\": ${body_parameters[${key}]}"
        if [[ $count -lt $body_parameter_count-1 ]]; then
            body_json+=", "
        fi
        count+=1
    done
    body_json+="}'"

    if [[ "${#body_parameters[@]}" -eq 0 ]]; then
        echo ""
    else
        echo "${body_json}"
    fi
}

##############################################################################
#
# Check if provided parameters match specification requirements
#
##############################################################################
validate_request_parameters() {
    local path_template=$1
    local -n path_params=$2
    local -n query_params=$3

    # First replace all path parameters in the path
    for pparam in "${path_params[@]}"; do
        regexp="(.*)(\{$pparam\})(.*)"
        if [[ $path_template =~ $regexp ]]; then
            path_template=${BASH_REMATCH[1]}${operation_parameters[$pparam]}${BASH_REMATCH[3]}
        fi
    done

    # Now append query parameters - if any
    if [[ ${#query_params[@]} -gt 0 ]]; then
        path_template+="?"
    fi

    local query_parameter_count=${#query_params[@]}
    local count=0
    for qparam in "${query_params[@]}"; do
        # Get the array of parameter values
        local parameter_values=($(echo "${operation_parameters[$qparam]}" | sed -e 's/'":::"'/\n/g' | while read line; do echo $line | sed 's/[\t ]/'":::"'/g'; done))

        #
        # Check if the number of provided values is not less than minimum
        # required
        #
        if [[ "$force" = false ]]; then
            if [[ ${#parameter_values[@]} -lt ${operation_parameters_minimum_occurences["${operation}:::${qparam}"]} ]]; then
                echo "Error: Too few values provided for '${qparam}' parameter"
                exit 1
            fi

            #
            # Check if the number of provided values is not more than maximum
            #
            if [[ ${operation_parameters_maximum_occurences["${operation}:::${qparam}"]} -gt 0 \
                  && ${#parameter_values[@]} -gt ${operation_parameters_maximum_occurences["${operation}:::${qparam}"]} ]]; then
                if [[ "$force" = false ]]; then
                    echo "Error: Too many values provided for '${qparam}' parameter"
                    exit 1
                fi
            fi
        fi

        if [[ "${operation_parameters_collection_type[${operation}:::${qparam}]}" == "" ]]; then
            local vcount=0
            for qvalue in "${parameter_values[@]}"; do
                path_template+="${qparam}=${qvalue}"

                if [[ $vcount -lt ${#parameter_values[@]}-1 ]]; then
                    path_template+="&"
                fi
                vcount+=1
            done
        elif [[ "${operation_parameters_collection_type["${operation}:::${qparam}"]}" == "multi" ]]; then
            local vcount=0
            for qvalue in "${parameter_values[@]}"; do
                path_template+="${qparam}=${qvalue}"

                if [[ $vcount -lt ${#parameter_values[@]}-1 ]]; then
                    path_template+="&"
                fi
                vcount+=1
            done
        elif [[ "${operation_parameters_collection_type["${operation}:::${qparam}"]}" == "csv" ]]; then
            path_template+="${qparam}="
            local vcount=0
            for qvalue in "${parameter_values[@]}"; do
                path_template+="${qvalue}"

                if [[ $vcount -lt ${#parameter_values[@]}-1 ]]; then
                    path_template+=","
                fi
                vcount+=1
            done
        elif [[ "${operation_parameters_collection_type["${operation}:::${qparam}"]}" == "ssv" ]]; then
            path_template+="${qparam}="
            for qvalue in "${parameter_values[@]}"; do
                path_template+="${qvalue}"

                if [[ $vcount -lt ${#parameter_values[@]}-1 ]]; then
                    path_template+=" "
                fi
                vcount+=1
            done
        elif [[ "${operation_parameters_collection_type["${operation}:::${qparam}"]}" == "tsv" ]]; then
            path_template+="${qparam}="
            for qvalue in "${parameter_values[@]}"; do
                path_template+="${qvalue}"

                if [[ $vcount -lt ${#parameter_values[@]}-1 ]]; then
                    path_template+="\t"
                fi
                vcount+=1
            done
        else
            echo -e ""
            echo -e "Error: Unsupported collection format "
            echo -e ""
            exit 1
        fi


        if [[ $count -lt $query_parameter_count-1 ]]; then
            path_template+="&"
        fi
        count+=1
    done

}



##############################################################################
#
# Build request path including query parameters
#
##############################################################################
build_request_path() {
    local path_template=$1
    local -n path_params=$2
    local -n query_params=$3


    # First replace all path parameters in the path
    for pparam in "${path_params[@]}"; do
        regexp="(.*)(\{$pparam\})(.*)"
        if [[ $path_template =~ $regexp ]]; then
            path_template=${BASH_REMATCH[1]}${operation_parameters[$pparam]}${BASH_REMATCH[3]}
        fi
    done

    local query_request_part=""

    local query_parameter_count=${#query_params[@]}
    local count=0
    for qparam in "${query_params[@]}"; do
        # Get the array of parameter values
        local parameter_values=($(echo "${operation_parameters[$qparam]}" | sed -e 's/'":::"'/\n/g' | while read line; do echo $line | sed 's/[\t ]/'":::"'/g'; done))
        local parameter_value=""

        #
        # Check if the number of provided values is not less than minimum
        # required
        #
        if [[ "$force" = false ]]; then
            if [[ ${#parameter_values[@]} -lt ${operation_parameters_minimum_occurences["${operation}:::${qparam}"]} ]]; then
                echo "Error: Too few values provided for '${qparam}' parameter"
                exit 1
            fi

            #
            # Check if the number of provided values is not more than maximum
            #
            if [[ ${operation_parameters_maximum_occurences["${operation}:::${qparam}"]} -gt 0 \
                  && ${#parameter_values[@]} -gt ${operation_parameters_maximum_occurences["${operation}:::${qparam}"]} ]]; then
                if [[ "$force" = false ]]; then
                    echo "Error: Too many values provided for '${qparam}' parameter"
                    exit 1
                fi
            fi
        fi

        #
        # Append parameters without specific cardinality
        #
        if [[ "${operation_parameters_collection_type["${operation}:::${qparam}"]}" == "" ]]; then
            local vcount=0
            for qvalue in "${parameter_values[@]}"; do
                parameter_value+="${qparam}=${qvalue}"

                if [[ $vcount -lt ${#parameter_values[@]}-1 ]]; then
                    parameter_value+="&"
                fi
                vcount+=1
            done
        #
        # Append parameters specified as 'mutli' collections i.e. param=value1&param=value2&...
        #
        elif [[ "${operation_parameters_collection_type["${operation}:::${qparam}"]}" == "multi" ]]; then
            local vcount=0
            for qvalue in "${parameter_values[@]}"; do
                parameter_value+="${qparam}=${qvalue}"

                if [[ $vcount -lt ${#parameter_values[@]}-1 ]]; then
                    parameter_value+="&"
                fi
                vcount+=1
            done
        #
        # Append parameters specified as 'csv' collections i.e. param=value1,value2,...
        #
        elif [[ "${operation_parameters_collection_type["${operation}:::${qparam}"]}" == "csv" ]]; then
            parameter_value+="${qparam}="
            local vcount=0
            for qvalue in "${parameter_values[@]}"; do
                parameter_value+="${qvalue}"

                if [[ $vcount -lt ${#parameter_values[@]}-1 ]]; then
                    parameter_value+=","
                fi
                vcount+=1
            done
        #
        # Append parameters specified as 'ssv' collections i.e. param="value1 value2 ..."
        #
        elif [[ "${operation_parameters_collection_type["${operation}:::${qparam}"]}" == "ssv" ]]; then
            parameter_value+="${qparam}="
            local vcount=0
            for qvalue in "${parameter_values[@]}"; do
                parameter_value+="${qvalue}"

                if [[ $vcount -lt ${#parameter_values[@]}-1 ]]; then
                    parameter_value+=" "
                fi
                vcount+=1
            done
        #
        # Append parameters specified as 'tsv' collections i.e. param="value1\tvalue2\t..."
        #
        elif [[ "${operation_parameters_collection_type["${operation}:::${qparam}"]}" == "tsv" ]]; then
            parameter_value+="${qparam}="
            local vcount=0
            for qvalue in "${parameter_values[@]}"; do
                parameter_value+="${qvalue}"

                if [[ $vcount -lt ${#parameter_values[@]}-1 ]]; then
                    parameter_value+="\t"
                fi
                vcount+=1
            done
        fi

        if [[ -n "${parameter_value}" ]]; then
            query_request_part+="${parameter_value}"
        fi

        if [[ $count -lt $query_parameter_count-1 && -n "${parameter_value}" ]]; then
            query_request_part+="&"
        fi

        count+=1

    done


    # Now append query parameters - if any
    if [[ -n "${query_request_part}" ]]; then
        path_template+="?$(echo ${query_request_part} | sed s'/&$//')"
    fi

    echo $path_template
}



###############################################################################
#
# Print main help message
#
###############################################################################
print_help() {
cat <<EOF

$(tput bold)$(tput setaf 7)Switch Database REST API command line client (API version 1.2.1)$(tput sgr0)

$(tput bold)$(tput setaf 7)Usage$(tput sgr0)

  $(tput setaf 2)${script_name}$(tput sgr0) [-h|--help] [-V|--version] [--about] [$(tput setaf 1)<curl-options>$(tput sgr0)]
           [-ac|--accept $(tput setaf 2)<mime-type>$(tput sgr0)] [-ct,--content-type $(tput setaf 2)<mime-type>$(tput sgr0)]
           [--host $(tput setaf 6)<url>$(tput sgr0)] [--dry-run] $(tput setaf 3)<operation>$(tput sgr0) [-h|--help] [$(tput setaf 4)<headers>$(tput sgr0)]
           [$(tput setaf 5)<parameters>$(tput sgr0)] [$(tput setaf 5)<body-parameters>$(tput sgr0)]

  - $(tput setaf 6)<url>$(tput sgr0) - endpoint of the REST service without basepath

  - $(tput setaf 1)<curl-options>$(tput sgr0) - any valid cURL options can be passed before $(tput setaf 3)<operation>$(tput sgr0)
  - $(tput setaf 2)<mime-type>$(tput sgr0) - either full mime-type or one of supported abbreviations:
                   (text, html, md, csv, css, rtf, json, xml, yaml, js, bin,
                    rdf, jpg, png, gif, bmp, tiff)
  - $(tput setaf 4)<headers>$(tput sgr0) - HTTP headers can be passed in the form $(tput setaf 3)HEADER$(tput sgr0):$(tput setaf 4)VALUE$(tput sgr0)
  - $(tput setaf 5)<parameters>$(tput sgr0) - REST operation parameters can be passed in the following
                   forms:
                   * $(tput setaf 3)KEY$(tput sgr0)=$(tput setaf 4)VALUE$(tput sgr0) - path or query parameters
  - $(tput setaf 5)<body-parameters>$(tput sgr0) - simple JSON body content (first level only) can be build
                        using the following arguments:
                        * $(tput setaf 3)KEY$(tput sgr0)==$(tput setaf 4)VALUE$(tput sgr0) - body parameters which will be added to body
                                      JSON as '{ ..., "$(tput setaf 3)KEY$(tput sgr0)": "$(tput setaf 4)VALUE$(tput sgr0)", ... }'
                        * $(tput setaf 3)KEY$(tput sgr0):=$(tput setaf 4)VALUE$(tput sgr0) - body parameters which will be added to body
                                      JSON as '{ ..., "$(tput setaf 3)KEY$(tput sgr0)": $(tput setaf 4)VALUE$(tput sgr0), ... }'

EOF
    echo -e "$(tput bold)$(tput setaf 7)Operations (grouped by tags)$(tput sgr0)"
    echo ""
    echo -e "$(tput bold)$(tput setaf 7)[authorization]$(tput sgr0)"
read -d '' ops <<EOF
  $(tput setaf 6)tokenGet$(tput sgr0);Generate Access Token
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "$(tput bold)$(tput setaf 7)[dBOperations]$(tput sgr0)"
read -d '' ops <<EOF
  $(tput setaf 6)addPost$(tput sgr0);Add is used for adding a data object to the list created at Switch DB.
  $(tput setaf 6)listPost$(tput sgr0);It's used for listing a data added before.
  $(tput setaf 6)setDelete$(tput sgr0);It's used for deleting a data added before at Switch DB.
  $(tput setaf 6)setPost$(tput sgr0);It's used for updating a data object that is already added to Switch DB.
EOF
echo "  $ops" | column -t -s ';'
    echo ""
    echo -e "$(tput bold)$(tput setaf 7)Options$(tput sgr0)"
    echo -e "  -h,--help\t\t\t\tPrint this help"
    echo -e "  -V,--version\t\t\t\tPrint API version"
    echo -e "  --about\t\t\t\tPrint the information about service"
    echo -e "  --host $(tput setaf 6)<url>$(tput sgr0)\t\t\t\tSpecify the host URL "
echo -e "              \t\t\t\t(e.g. 'https://tr02.switchapi.com')"

    echo -e "  --force\t\t\t\tForce command invocation in spite of missing"
    echo -e "         \t\t\t\trequired parameters or wrong content type"
    echo -e "  --dry-run\t\t\t\tPrint out the cURL command without"
    echo -e "           \t\t\t\texecuting it"
    echo -e "  -ac,--accept $(tput setaf 3)<mime-type>$(tput sgr0)\t\tSet the 'Accept' header in the request"
    echo -e "  -ct,--content-type $(tput setaf 3)<mime-type>$(tput sgr0)\tSet the 'Content-type' header in "
    echo -e "                                \tthe request"
    echo ""
}


##############################################################################
#
# Print REST service description
#
##############################################################################
print_about() {
    echo ""
    echo -e "$(tput bold)$(tput setaf 7)Switch Database REST API command line client (API version 1.2.1)$(tput sgr0)"
    echo ""
    echo -e "License: "
    echo -e "Contact: "
    echo ""
read -d '' appdescription <<EOF

Switch API is the primary endpoint of data sevices and Switch DB's platform. You can do adding, editing, deleting or listing data works to your database with query operations by using this low-level API based on HTTP.
EOF
echo "$appdescription" | fold -sw 80
}


##############################################################################
#
# Print REST api version
#
##############################################################################
print_version() {
    echo ""
    echo -e "$(tput bold)Switch Database REST API command line client (API version 1.2.1)$(tput sgr0)"
    echo ""
}

##############################################################################
#
# Print help for tokenGet operation
#
##############################################################################
print_tokenGet_help() {
    echo ""
    echo -e "$(tput bold)$(tput setaf 7)tokenGet - Generate Access Token$(tput sgr0)"
    echo -e ""
    echo -e "For generating Access Token, you need API Key and API Secret parameters that are provided from the developer portal. At the request, API Key that will be sent by using header is generated as portal API Key and Signature parameter is generated as md5(APISecret + ExpireTimestamp) format. At Expire parameter, token's expire date and time information must be proper to ISO 8601 standarts and Unix Time format with msec information." | fold -sw 80
    echo -e ""
    echo -e "$(tput bold)$(tput setaf 7)Parameters$(tput sgr0)"
    echo -e "  * $(tput setaf 2)APIKey$(tput sgr0) $(tput setaf 4)[String]$(tput sgr0) $(tput setaf 1)(required)$(tput sgr0)$(tput sgr0) - Your Switch API Key. $(tput setaf 3)Specify as: APIKey:value$(tput sgr0)" | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * $(tput setaf 2)Signature$(tput sgr0) $(tput setaf 4)[String]$(tput sgr0) $(tput setaf 1)(required)$(tput sgr0)$(tput sgr0) - Signature parameter is generated as md5(APISecret + ExpireTimestamp) format. $(tput setaf 3)Specify as: Signature:value$(tput sgr0)" | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * $(tput setaf 2)Expire$(tput sgr0) $(tput setaf 4)[Integer]$(tput sgr0) $(tput setaf 1)(required)$(tput sgr0)$(tput sgr0) - Expire parameter, token's expire date and time information must be proper to ISO 8601 standarts and Unix Time format with msec information. $(tput setaf 3)Specify as: Expire:value$(tput sgr0)" | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "$(tput bold)$(tput setaf 7)Responses$(tput sgr0)"
    case 200 in
        1*)
        echo -e "$(tput setaf 7)  200;Access Token String$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        2*)
        echo -e "$(tput setaf 2)  200;Access Token String$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        3*)
        echo -e "$(tput setaf 3)  200;Access Token String$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        4*)
        echo -e "$(tput setaf 1)  200;Access Token String$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        5*)
        echo -e "$(tput setaf 5)  200;Access Token String$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        *)
        echo -e "$(tput setaf 7)  200;Access Token String$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
    esac
    case 401 in
        1*)
        echo -e "$(tput setaf 7)  401;Unauthorized (Given AccessToken parameter is invalid.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        2*)
        echo -e "$(tput setaf 2)  401;Unauthorized (Given AccessToken parameter is invalid.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        3*)
        echo -e "$(tput setaf 3)  401;Unauthorized (Given AccessToken parameter is invalid.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        4*)
        echo -e "$(tput setaf 1)  401;Unauthorized (Given AccessToken parameter is invalid.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        5*)
        echo -e "$(tput setaf 5)  401;Unauthorized (Given AccessToken parameter is invalid.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        *)
        echo -e "$(tput setaf 7)  401;Unauthorized (Given AccessToken parameter is invalid.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
    esac
    case 403 in
        1*)
        echo -e "$(tput setaf 7)  403;Security Exception (Unsecured request.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        2*)
        echo -e "$(tput setaf 2)  403;Security Exception (Unsecured request.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        3*)
        echo -e "$(tput setaf 3)  403;Security Exception (Unsecured request.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        4*)
        echo -e "$(tput setaf 1)  403;Security Exception (Unsecured request.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        5*)
        echo -e "$(tput setaf 5)  403;Security Exception (Unsecured request.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        *)
        echo -e "$(tput setaf 7)  403;Security Exception (Unsecured request.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
    esac
    case 404 in
        1*)
        echo -e "$(tput setaf 7)  404;Method Not Found (Called API could not found.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        2*)
        echo -e "$(tput setaf 2)  404;Method Not Found (Called API could not found.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        3*)
        echo -e "$(tput setaf 3)  404;Method Not Found (Called API could not found.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        4*)
        echo -e "$(tput setaf 1)  404;Method Not Found (Called API could not found.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        5*)
        echo -e "$(tput setaf 5)  404;Method Not Found (Called API could not found.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        *)
        echo -e "$(tput setaf 7)  404;Method Not Found (Called API could not found.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
    esac
    case 429 in
        1*)
        echo -e "$(tput setaf 7)  429;TooManyRequests (API limit excess. The remaning time to the date-time for that API can answer the requests is calculated as Unix Time format under TheNextReset.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        2*)
        echo -e "$(tput setaf 2)  429;TooManyRequests (API limit excess. The remaning time to the date-time for that API can answer the requests is calculated as Unix Time format under TheNextReset.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        3*)
        echo -e "$(tput setaf 3)  429;TooManyRequests (API limit excess. The remaning time to the date-time for that API can answer the requests is calculated as Unix Time format under TheNextReset.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        4*)
        echo -e "$(tput setaf 1)  429;TooManyRequests (API limit excess. The remaning time to the date-time for that API can answer the requests is calculated as Unix Time format under TheNextReset.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        5*)
        echo -e "$(tput setaf 5)  429;TooManyRequests (API limit excess. The remaning time to the date-time for that API can answer the requests is calculated as Unix Time format under TheNextReset.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        *)
        echo -e "$(tput setaf 7)  429;TooManyRequests (API limit excess. The remaning time to the date-time for that API can answer the requests is calculated as Unix Time format under TheNextReset.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
    esac
    case 500 in
        1*)
        echo -e "$(tput setaf 7)  500;ServiceException (Unexpected Error There is a detailed explanation under ErrorMessage.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        2*)
        echo -e "$(tput setaf 2)  500;ServiceException (Unexpected Error There is a detailed explanation under ErrorMessage.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        3*)
        echo -e "$(tput setaf 3)  500;ServiceException (Unexpected Error There is a detailed explanation under ErrorMessage.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        4*)
        echo -e "$(tput setaf 1)  500;ServiceException (Unexpected Error There is a detailed explanation under ErrorMessage.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        5*)
        echo -e "$(tput setaf 5)  500;ServiceException (Unexpected Error There is a detailed explanation under ErrorMessage.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        *)
        echo -e "$(tput setaf 7)  500;ServiceException (Unexpected Error There is a detailed explanation under ErrorMessage.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
    esac
}
##############################################################################
#
# Print help for addPost operation
#
##############################################################################
print_addPost_help() {
    echo ""
    echo -e "$(tput bold)$(tput setaf 7)addPost - Add is used for adding a data object to the list created at Switch DB.$(tput sgr0)"
    echo -e ""
    echo -e "You can choose the list that will be added tha data set to with List parameter that will be sent to Header. It's equal to INSERT query at the relational databases model. The data set that will be added to the database is transmited at request body. For versions upper than v1.2.1, if the data sent is an array, all items in the array are added one by one, so they are added as a whole." | fold -sw 80
    echo -e ""
    echo -e "$(tput bold)$(tput setaf 7)Parameters$(tput sgr0)"
    echo -e "  * $(tput setaf 2)APIKey$(tput sgr0) $(tput setaf 4)[String]$(tput sgr0) $(tput setaf 1)(required)$(tput sgr0)$(tput sgr0) - Your Switch API Key. $(tput setaf 3)Specify as: APIKey:value$(tput sgr0)" | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * $(tput setaf 2)AccessToken$(tput sgr0) $(tput setaf 4)[String]$(tput sgr0) $(tput setaf 1)(required)$(tput sgr0)$(tput sgr0) - Your Access Token. $(tput setaf 3)Specify as: AccessToken:value$(tput sgr0)" | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * $(tput setaf 2)List$(tput sgr0) $(tput setaf 4)[String]$(tput sgr0) $(tput setaf 1)(required)$(tput sgr0)$(tput sgr0) - Your data list name. $(tput setaf 3)Specify as: List:value$(tput sgr0)" | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * $(tput setaf 2)body$(tput sgr0) $(tput setaf 4)[]$(tput sgr0) $(tput setaf 1)(required)$(tput sgr0)$(tput sgr0) - Your new value JSON." | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "$(tput bold)$(tput setaf 7)Responses$(tput sgr0)"
    case 200 in
        1*)
        echo -e "$(tput setaf 7)  200;Operation Response$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        2*)
        echo -e "$(tput setaf 2)  200;Operation Response$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        3*)
        echo -e "$(tput setaf 3)  200;Operation Response$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        4*)
        echo -e "$(tput setaf 1)  200;Operation Response$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        5*)
        echo -e "$(tput setaf 5)  200;Operation Response$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        *)
        echo -e "$(tput setaf 7)  200;Operation Response$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
    esac
    case 401 in
        1*)
        echo -e "$(tput setaf 7)  401;Unauthorized (Given AccessToken parameter is invalid.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        2*)
        echo -e "$(tput setaf 2)  401;Unauthorized (Given AccessToken parameter is invalid.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        3*)
        echo -e "$(tput setaf 3)  401;Unauthorized (Given AccessToken parameter is invalid.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        4*)
        echo -e "$(tput setaf 1)  401;Unauthorized (Given AccessToken parameter is invalid.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        5*)
        echo -e "$(tput setaf 5)  401;Unauthorized (Given AccessToken parameter is invalid.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        *)
        echo -e "$(tput setaf 7)  401;Unauthorized (Given AccessToken parameter is invalid.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
    esac
    case 403 in
        1*)
        echo -e "$(tput setaf 7)  403;Security Exception (Unsecured request.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        2*)
        echo -e "$(tput setaf 2)  403;Security Exception (Unsecured request.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        3*)
        echo -e "$(tput setaf 3)  403;Security Exception (Unsecured request.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        4*)
        echo -e "$(tput setaf 1)  403;Security Exception (Unsecured request.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        5*)
        echo -e "$(tput setaf 5)  403;Security Exception (Unsecured request.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        *)
        echo -e "$(tput setaf 7)  403;Security Exception (Unsecured request.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
    esac
    case 404 in
        1*)
        echo -e "$(tput setaf 7)  404;Method Not Found (Called API could not found.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        2*)
        echo -e "$(tput setaf 2)  404;Method Not Found (Called API could not found.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        3*)
        echo -e "$(tput setaf 3)  404;Method Not Found (Called API could not found.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        4*)
        echo -e "$(tput setaf 1)  404;Method Not Found (Called API could not found.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        5*)
        echo -e "$(tput setaf 5)  404;Method Not Found (Called API could not found.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        *)
        echo -e "$(tput setaf 7)  404;Method Not Found (Called API could not found.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
    esac
    case 429 in
        1*)
        echo -e "$(tput setaf 7)  429;TooManyRequests (API limit excess. The remaning time to the date-time for that API can answer the requests is calculated as Unix Time format under TheNextReset.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        2*)
        echo -e "$(tput setaf 2)  429;TooManyRequests (API limit excess. The remaning time to the date-time for that API can answer the requests is calculated as Unix Time format under TheNextReset.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        3*)
        echo -e "$(tput setaf 3)  429;TooManyRequests (API limit excess. The remaning time to the date-time for that API can answer the requests is calculated as Unix Time format under TheNextReset.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        4*)
        echo -e "$(tput setaf 1)  429;TooManyRequests (API limit excess. The remaning time to the date-time for that API can answer the requests is calculated as Unix Time format under TheNextReset.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        5*)
        echo -e "$(tput setaf 5)  429;TooManyRequests (API limit excess. The remaning time to the date-time for that API can answer the requests is calculated as Unix Time format under TheNextReset.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        *)
        echo -e "$(tput setaf 7)  429;TooManyRequests (API limit excess. The remaning time to the date-time for that API can answer the requests is calculated as Unix Time format under TheNextReset.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
    esac
    case 500 in
        1*)
        echo -e "$(tput setaf 7)  500;ServiceException (Unexpected Error There is a detailed explanation under ErrorMessage.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        2*)
        echo -e "$(tput setaf 2)  500;ServiceException (Unexpected Error There is a detailed explanation under ErrorMessage.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        3*)
        echo -e "$(tput setaf 3)  500;ServiceException (Unexpected Error There is a detailed explanation under ErrorMessage.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        4*)
        echo -e "$(tput setaf 1)  500;ServiceException (Unexpected Error There is a detailed explanation under ErrorMessage.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        5*)
        echo -e "$(tput setaf 5)  500;ServiceException (Unexpected Error There is a detailed explanation under ErrorMessage.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        *)
        echo -e "$(tput setaf 7)  500;ServiceException (Unexpected Error There is a detailed explanation under ErrorMessage.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
    esac
}
##############################################################################
#
# Print help for listPost operation
#
##############################################################################
print_listPost_help() {
    echo ""
    echo -e "$(tput bold)$(tput setaf 7)listPost - It's used for listing a data added before.$(tput sgr0)"
    echo -e ""
    echo -e "List parameter sent remarks the list that will be do listing work on at Header. It's equal to SELECT query at relational databases." | fold -sw 80
    echo -e ""
    echo -e "$(tput bold)$(tput setaf 7)Parameters$(tput sgr0)"
    echo -e "  * $(tput setaf 2)APIKey$(tput sgr0) $(tput setaf 4)[String]$(tput sgr0) $(tput setaf 1)(required)$(tput sgr0)$(tput sgr0) - Your Switch API Key. $(tput setaf 3)Specify as: APIKey:value$(tput sgr0)" | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * $(tput setaf 2)AccessToken$(tput sgr0) $(tput setaf 4)[String]$(tput sgr0) $(tput setaf 1)(required)$(tput sgr0)$(tput sgr0) - Your Access Token. $(tput setaf 3)Specify as: AccessToken:value$(tput sgr0)" | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * $(tput setaf 2)List$(tput sgr0) $(tput setaf 4)[String]$(tput sgr0) $(tput setaf 1)(required)$(tput sgr0)$(tput sgr0) - Your data list name. $(tput setaf 3)Specify as: List:value$(tput sgr0)" | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * $(tput setaf 2)body$(tput sgr0) $(tput setaf 4)[]$(tput sgr0) $(tput setaf 1)(required)$(tput sgr0)$(tput sgr0) - Your Switch DB Query." | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "$(tput bold)$(tput setaf 7)Responses$(tput sgr0)"
    case 200 in
        1*)
        echo -e "$(tput setaf 7)  200;List Item Array$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        2*)
        echo -e "$(tput setaf 2)  200;List Item Array$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        3*)
        echo -e "$(tput setaf 3)  200;List Item Array$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        4*)
        echo -e "$(tput setaf 1)  200;List Item Array$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        5*)
        echo -e "$(tput setaf 5)  200;List Item Array$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        *)
        echo -e "$(tput setaf 7)  200;List Item Array$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
    esac
    case 401 in
        1*)
        echo -e "$(tput setaf 7)  401;Unauthorized (Given AccessToken parameter is invalid.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        2*)
        echo -e "$(tput setaf 2)  401;Unauthorized (Given AccessToken parameter is invalid.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        3*)
        echo -e "$(tput setaf 3)  401;Unauthorized (Given AccessToken parameter is invalid.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        4*)
        echo -e "$(tput setaf 1)  401;Unauthorized (Given AccessToken parameter is invalid.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        5*)
        echo -e "$(tput setaf 5)  401;Unauthorized (Given AccessToken parameter is invalid.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        *)
        echo -e "$(tput setaf 7)  401;Unauthorized (Given AccessToken parameter is invalid.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
    esac
    case 403 in
        1*)
        echo -e "$(tput setaf 7)  403;Security Exception (Unsecured request.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        2*)
        echo -e "$(tput setaf 2)  403;Security Exception (Unsecured request.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        3*)
        echo -e "$(tput setaf 3)  403;Security Exception (Unsecured request.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        4*)
        echo -e "$(tput setaf 1)  403;Security Exception (Unsecured request.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        5*)
        echo -e "$(tput setaf 5)  403;Security Exception (Unsecured request.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        *)
        echo -e "$(tput setaf 7)  403;Security Exception (Unsecured request.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
    esac
    case 404 in
        1*)
        echo -e "$(tput setaf 7)  404;Method Not Found (Called API could not found.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        2*)
        echo -e "$(tput setaf 2)  404;Method Not Found (Called API could not found.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        3*)
        echo -e "$(tput setaf 3)  404;Method Not Found (Called API could not found.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        4*)
        echo -e "$(tput setaf 1)  404;Method Not Found (Called API could not found.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        5*)
        echo -e "$(tput setaf 5)  404;Method Not Found (Called API could not found.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        *)
        echo -e "$(tput setaf 7)  404;Method Not Found (Called API could not found.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
    esac
    case 429 in
        1*)
        echo -e "$(tput setaf 7)  429;TooManyRequests (API limit excess. The remaning time to the date-time for that API can answer the requests is calculated as Unix Time format under TheNextReset.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        2*)
        echo -e "$(tput setaf 2)  429;TooManyRequests (API limit excess. The remaning time to the date-time for that API can answer the requests is calculated as Unix Time format under TheNextReset.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        3*)
        echo -e "$(tput setaf 3)  429;TooManyRequests (API limit excess. The remaning time to the date-time for that API can answer the requests is calculated as Unix Time format under TheNextReset.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        4*)
        echo -e "$(tput setaf 1)  429;TooManyRequests (API limit excess. The remaning time to the date-time for that API can answer the requests is calculated as Unix Time format under TheNextReset.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        5*)
        echo -e "$(tput setaf 5)  429;TooManyRequests (API limit excess. The remaning time to the date-time for that API can answer the requests is calculated as Unix Time format under TheNextReset.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        *)
        echo -e "$(tput setaf 7)  429;TooManyRequests (API limit excess. The remaning time to the date-time for that API can answer the requests is calculated as Unix Time format under TheNextReset.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
    esac
    case 500 in
        1*)
        echo -e "$(tput setaf 7)  500;ServiceException (Unexpected Error There is a detailed explanation under ErrorMessage.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        2*)
        echo -e "$(tput setaf 2)  500;ServiceException (Unexpected Error There is a detailed explanation under ErrorMessage.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        3*)
        echo -e "$(tput setaf 3)  500;ServiceException (Unexpected Error There is a detailed explanation under ErrorMessage.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        4*)
        echo -e "$(tput setaf 1)  500;ServiceException (Unexpected Error There is a detailed explanation under ErrorMessage.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        5*)
        echo -e "$(tput setaf 5)  500;ServiceException (Unexpected Error There is a detailed explanation under ErrorMessage.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        *)
        echo -e "$(tput setaf 7)  500;ServiceException (Unexpected Error There is a detailed explanation under ErrorMessage.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
    esac
}
##############################################################################
#
# Print help for setDelete operation
#
##############################################################################
print_setDelete_help() {
    echo ""
    echo -e "$(tput bold)$(tput setaf 7)setDelete - It's used for deleting a data added before at Switch DB.$(tput sgr0)"
    echo -e ""
    echo -e "List parameter sent remarks the list that will be deleted data from at Header and ListItemId parameter remarks the ID consisted by Switch DB for the data that will be deleted. It's equal to DELETE query at relational databases." | fold -sw 80
    echo -e ""
    echo -e "$(tput bold)$(tput setaf 7)Parameters$(tput sgr0)"
    echo -e "  * $(tput setaf 2)APIKey$(tput sgr0) $(tput setaf 4)[String]$(tput sgr0) $(tput setaf 1)(required)$(tput sgr0)$(tput sgr0) - Your Switch API Key. $(tput setaf 3)Specify as: APIKey:value$(tput sgr0)" | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * $(tput setaf 2)AccessToken$(tput sgr0) $(tput setaf 4)[String]$(tput sgr0) $(tput setaf 1)(required)$(tput sgr0)$(tput sgr0) - Your Access Token. $(tput setaf 3)Specify as: AccessToken:value$(tput sgr0)" | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * $(tput setaf 2)List$(tput sgr0) $(tput setaf 4)[String]$(tput sgr0) $(tput setaf 1)(required)$(tput sgr0)$(tput sgr0) - Your data list name. $(tput setaf 3)Specify as: List:value$(tput sgr0)" | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * $(tput setaf 2)ListItemId$(tput sgr0) $(tput setaf 4)[String]$(tput sgr0) $(tput setaf 1)(required)$(tput sgr0)$(tput sgr0) - Your list item id. $(tput setaf 3)Specify as: ListItemId:value$(tput sgr0)" | fold -sw 80 | sed '2,$s/^/    /'
    echo ""
    echo -e "$(tput bold)$(tput setaf 7)Responses$(tput sgr0)"
    case 200 in
        1*)
        echo -e "$(tput setaf 7)  200;Operation Response$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        2*)
        echo -e "$(tput setaf 2)  200;Operation Response$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        3*)
        echo -e "$(tput setaf 3)  200;Operation Response$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        4*)
        echo -e "$(tput setaf 1)  200;Operation Response$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        5*)
        echo -e "$(tput setaf 5)  200;Operation Response$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        *)
        echo -e "$(tput setaf 7)  200;Operation Response$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
    esac
    case 401 in
        1*)
        echo -e "$(tput setaf 7)  401;Unauthorized (Given AccessToken parameter is invalid.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        2*)
        echo -e "$(tput setaf 2)  401;Unauthorized (Given AccessToken parameter is invalid.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        3*)
        echo -e "$(tput setaf 3)  401;Unauthorized (Given AccessToken parameter is invalid.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        4*)
        echo -e "$(tput setaf 1)  401;Unauthorized (Given AccessToken parameter is invalid.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        5*)
        echo -e "$(tput setaf 5)  401;Unauthorized (Given AccessToken parameter is invalid.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        *)
        echo -e "$(tput setaf 7)  401;Unauthorized (Given AccessToken parameter is invalid.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
    esac
    case 403 in
        1*)
        echo -e "$(tput setaf 7)  403;Security Exception (Unsecured request.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        2*)
        echo -e "$(tput setaf 2)  403;Security Exception (Unsecured request.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        3*)
        echo -e "$(tput setaf 3)  403;Security Exception (Unsecured request.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        4*)
        echo -e "$(tput setaf 1)  403;Security Exception (Unsecured request.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        5*)
        echo -e "$(tput setaf 5)  403;Security Exception (Unsecured request.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        *)
        echo -e "$(tput setaf 7)  403;Security Exception (Unsecured request.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
    esac
    case 404 in
        1*)
        echo -e "$(tput setaf 7)  404;Method Not Found (Called API could not found.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        2*)
        echo -e "$(tput setaf 2)  404;Method Not Found (Called API could not found.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        3*)
        echo -e "$(tput setaf 3)  404;Method Not Found (Called API could not found.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        4*)
        echo -e "$(tput setaf 1)  404;Method Not Found (Called API could not found.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        5*)
        echo -e "$(tput setaf 5)  404;Method Not Found (Called API could not found.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        *)
        echo -e "$(tput setaf 7)  404;Method Not Found (Called API could not found.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
    esac
    case 429 in
        1*)
        echo -e "$(tput setaf 7)  429;TooManyRequests (API limit excess. The remaning time to the date-time for that API can answer the requests is calculated as Unix Time format under TheNextReset.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        2*)
        echo -e "$(tput setaf 2)  429;TooManyRequests (API limit excess. The remaning time to the date-time for that API can answer the requests is calculated as Unix Time format under TheNextReset.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        3*)
        echo -e "$(tput setaf 3)  429;TooManyRequests (API limit excess. The remaning time to the date-time for that API can answer the requests is calculated as Unix Time format under TheNextReset.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        4*)
        echo -e "$(tput setaf 1)  429;TooManyRequests (API limit excess. The remaning time to the date-time for that API can answer the requests is calculated as Unix Time format under TheNextReset.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        5*)
        echo -e "$(tput setaf 5)  429;TooManyRequests (API limit excess. The remaning time to the date-time for that API can answer the requests is calculated as Unix Time format under TheNextReset.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        *)
        echo -e "$(tput setaf 7)  429;TooManyRequests (API limit excess. The remaning time to the date-time for that API can answer the requests is calculated as Unix Time format under TheNextReset.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
    esac
    case 500 in
        1*)
        echo -e "$(tput setaf 7)  500;ServiceException (Unexpected Error There is a detailed explanation under ErrorMessage.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        2*)
        echo -e "$(tput setaf 2)  500;ServiceException (Unexpected Error There is a detailed explanation under ErrorMessage.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        3*)
        echo -e "$(tput setaf 3)  500;ServiceException (Unexpected Error There is a detailed explanation under ErrorMessage.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        4*)
        echo -e "$(tput setaf 1)  500;ServiceException (Unexpected Error There is a detailed explanation under ErrorMessage.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        5*)
        echo -e "$(tput setaf 5)  500;ServiceException (Unexpected Error There is a detailed explanation under ErrorMessage.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        *)
        echo -e "$(tput setaf 7)  500;ServiceException (Unexpected Error There is a detailed explanation under ErrorMessage.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
    esac
}
##############################################################################
#
# Print help for setPost operation
#
##############################################################################
print_setPost_help() {
    echo ""
    echo -e "$(tput bold)$(tput setaf 7)setPost - It's used for updating a data object that is already added to Switch DB.$(tput sgr0)"
    echo -e ""
    echo -e "In order to UPDATE a object, Listname and ListItemId parameters should be sent in the Header of the REQUEST as \"List\", \"ListItemId\", respectively, as shown in the example below. It's equal to UPDATE query at relational databases. The data set that will be edited is transmited to the database at request body." | fold -sw 80
    echo -e ""
    echo -e "$(tput bold)$(tput setaf 7)Parameters$(tput sgr0)"
    echo -e "  * $(tput setaf 2)APIKey$(tput sgr0) $(tput setaf 4)[String]$(tput sgr0) $(tput setaf 1)(required)$(tput sgr0)$(tput sgr0) - Your Switch API Key. $(tput setaf 3)Specify as: APIKey:value$(tput sgr0)" | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * $(tput setaf 2)AccessToken$(tput sgr0) $(tput setaf 4)[String]$(tput sgr0) $(tput setaf 1)(required)$(tput sgr0)$(tput sgr0) - Your Access Token. $(tput setaf 3)Specify as: AccessToken:value$(tput sgr0)" | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * $(tput setaf 2)List$(tput sgr0) $(tput setaf 4)[String]$(tput sgr0) $(tput setaf 1)(required)$(tput sgr0)$(tput sgr0) - Your data list name. $(tput setaf 3)Specify as: List:value$(tput sgr0)" | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * $(tput setaf 2)ListItemId$(tput sgr0) $(tput setaf 4)[String]$(tput sgr0) $(tput setaf 1)(required)$(tput sgr0)$(tput sgr0) - Your list item id. $(tput setaf 3)Specify as: ListItemId:value$(tput sgr0)" | fold -sw 80 | sed '2,$s/^/    /'
    echo -e "  * $(tput setaf 2)body$(tput sgr0) $(tput setaf 4)[]$(tput sgr0) $(tput setaf 1)(required)$(tput sgr0)$(tput sgr0) - Your new value JSON." | fold -sw 80 | sed '2,$s/^/    /'
    echo -e ""
    echo ""
    echo -e "$(tput bold)$(tput setaf 7)Responses$(tput sgr0)"
    case 200 in
        1*)
        echo -e "$(tput setaf 7)  200;Operation Response$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        2*)
        echo -e "$(tput setaf 2)  200;Operation Response$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        3*)
        echo -e "$(tput setaf 3)  200;Operation Response$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        4*)
        echo -e "$(tput setaf 1)  200;Operation Response$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        5*)
        echo -e "$(tput setaf 5)  200;Operation Response$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        *)
        echo -e "$(tput setaf 7)  200;Operation Response$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
    esac
    case 401 in
        1*)
        echo -e "$(tput setaf 7)  401;Unauthorized (Given AccessToken parameter is invalid.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        2*)
        echo -e "$(tput setaf 2)  401;Unauthorized (Given AccessToken parameter is invalid.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        3*)
        echo -e "$(tput setaf 3)  401;Unauthorized (Given AccessToken parameter is invalid.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        4*)
        echo -e "$(tput setaf 1)  401;Unauthorized (Given AccessToken parameter is invalid.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        5*)
        echo -e "$(tput setaf 5)  401;Unauthorized (Given AccessToken parameter is invalid.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        *)
        echo -e "$(tput setaf 7)  401;Unauthorized (Given AccessToken parameter is invalid.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
    esac
    case 403 in
        1*)
        echo -e "$(tput setaf 7)  403;Security Exception (Unsecured request.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        2*)
        echo -e "$(tput setaf 2)  403;Security Exception (Unsecured request.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        3*)
        echo -e "$(tput setaf 3)  403;Security Exception (Unsecured request.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        4*)
        echo -e "$(tput setaf 1)  403;Security Exception (Unsecured request.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        5*)
        echo -e "$(tput setaf 5)  403;Security Exception (Unsecured request.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        *)
        echo -e "$(tput setaf 7)  403;Security Exception (Unsecured request.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
    esac
    case 404 in
        1*)
        echo -e "$(tput setaf 7)  404;Method Not Found (Called API could not found.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        2*)
        echo -e "$(tput setaf 2)  404;Method Not Found (Called API could not found.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        3*)
        echo -e "$(tput setaf 3)  404;Method Not Found (Called API could not found.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        4*)
        echo -e "$(tput setaf 1)  404;Method Not Found (Called API could not found.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        5*)
        echo -e "$(tput setaf 5)  404;Method Not Found (Called API could not found.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        *)
        echo -e "$(tput setaf 7)  404;Method Not Found (Called API could not found.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
    esac
    case 429 in
        1*)
        echo -e "$(tput setaf 7)  429;TooManyRequests (API limit excess. The remaning time to the date-time for that API can answer the requests is calculated as Unix Time format under TheNextReset.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        2*)
        echo -e "$(tput setaf 2)  429;TooManyRequests (API limit excess. The remaning time to the date-time for that API can answer the requests is calculated as Unix Time format under TheNextReset.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        3*)
        echo -e "$(tput setaf 3)  429;TooManyRequests (API limit excess. The remaning time to the date-time for that API can answer the requests is calculated as Unix Time format under TheNextReset.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        4*)
        echo -e "$(tput setaf 1)  429;TooManyRequests (API limit excess. The remaning time to the date-time for that API can answer the requests is calculated as Unix Time format under TheNextReset.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        5*)
        echo -e "$(tput setaf 5)  429;TooManyRequests (API limit excess. The remaning time to the date-time for that API can answer the requests is calculated as Unix Time format under TheNextReset.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        *)
        echo -e "$(tput setaf 7)  429;TooManyRequests (API limit excess. The remaning time to the date-time for that API can answer the requests is calculated as Unix Time format under TheNextReset.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
    esac
    case 500 in
        1*)
        echo -e "$(tput setaf 7)  500;ServiceException (Unexpected Error There is a detailed explanation under ErrorMessage.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        2*)
        echo -e "$(tput setaf 2)  500;ServiceException (Unexpected Error There is a detailed explanation under ErrorMessage.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        3*)
        echo -e "$(tput setaf 3)  500;ServiceException (Unexpected Error There is a detailed explanation under ErrorMessage.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        4*)
        echo -e "$(tput setaf 1)  500;ServiceException (Unexpected Error There is a detailed explanation under ErrorMessage.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        5*)
        echo -e "$(tput setaf 5)  500;ServiceException (Unexpected Error There is a detailed explanation under ErrorMessage.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
        *)
        echo -e "$(tput setaf 7)  500;ServiceException (Unexpected Error There is a detailed explanation under ErrorMessage.)$(tput sgr0)" | column -t -s ';' | fold -sw 80 | sed '2,$s/^/       /'
        ;;
    esac
}


##############################################################################
#
# Call tokenGet operation
#
##############################################################################
call_tokenGet() {
    local path_parameter_names=()
    local query_parameter_names=()

    if [[ $force = false ]]; then
        validate_request_parameters "/Token" path_parameter_names query_parameter_names
    fi

    local path=$(build_request_path "/Token" path_parameter_names query_parameter_names)
    local method="GET"
    local headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call addPost operation
#
##############################################################################
call_addPost() {
    local path_parameter_names=()
    local query_parameter_names=()

    if [[ $force = false ]]; then
        validate_request_parameters "/Add" path_parameter_names query_parameter_names
    fi

    local path=$(build_request_path "/Add" path_parameter_names query_parameter_names)
    local method="POST"
    local headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call listPost operation
#
##############################################################################
call_listPost() {
    local path_parameter_names=()
    local query_parameter_names=()

    if [[ $force = false ]]; then
        validate_request_parameters "/List" path_parameter_names query_parameter_names
    fi

    local path=$(build_request_path "/List" path_parameter_names query_parameter_names)
    local method="POST"
    local headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}

##############################################################################
#
# Call setDelete operation
#
##############################################################################
call_setDelete() {
    local path_parameter_names=()
    local query_parameter_names=()

    if [[ $force = false ]]; then
        validate_request_parameters "/Set" path_parameter_names query_parameter_names
    fi

    local path=$(build_request_path "/Set" path_parameter_names query_parameter_names)
    local method="DELETE"
    local headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    if [[ "$print_curl" = true ]]; then
        echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    else
        eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\""
    fi
}

##############################################################################
#
# Call setPost operation
#
##############################################################################
call_setPost() {
    local path_parameter_names=()
    local query_parameter_names=()

    if [[ $force = false ]]; then
        validate_request_parameters "/Set" path_parameter_names query_parameter_names
    fi

    local path=$(build_request_path "/Set" path_parameter_names query_parameter_names)
    local method="POST"
    local headers_curl=$(header_arguments_to_curl)
    if [[ -n $header_accept ]]; then
        headers_curl="${headers_curl} -H 'Accept: ${header_accept}'"
    fi

    local basic_auth_option=""
    if [[ -n $basic_auth_credential ]]; then
        basic_auth_option="-u ${basic_auth_credential}"
    fi
    local body_json_curl=""

    #
    # Check if the user provided 'Content-type' headers in the
    # command line. If not try to set them based on the Swagger specification
    # if values produces and consumes are defined unambigously
    #


    if [[ -z $header_content_type && "$force" = false ]]; then
        :
    else
        headers_curl="${headers_curl} -H 'Content-type: ${header_content_type}'"
    fi


    #
    # If we have received some body content over pipe, pass it from the
    # temporary file to cURL
    #
    if [[ -n $body_content_temp_file ]]; then
        if [[ "$print_curl" = true ]]; then
            echo "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        else
            eval "cat ${body_content_temp_file} | curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} \"${host}${path}\" -d @-"
        fi
        rm "${body_content_temp_file}"
    #
    # If not, try to build the content body from arguments KEY==VALUE and KEY:=VALUE
    #
    else
        body_json_curl=$(body_parameters_to_json)
        if [[ "$print_curl" = true ]]; then
            echo "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        else
            eval "curl ${basic_auth_option} ${curl_arguments} ${headers_curl} -X ${method} ${body_json_curl} \"${host}${path}\""
        fi
    fi
}



##############################################################################
#
# Main
#
##############################################################################


# Check dependencies
type curl >/dev/null 2>&1 || { echo >&2 "Error: You do not have 'cURL' installed."; exit 1; }
type sed >/dev/null 2>&1 || { echo >&2 "Error: You do not have 'sed' installed."; exit 1; }
type column >/dev/null 2>&1 || { echo >&2 "Error: You do not have 'bsdmainutils' installed."; exit 1; }

#
# Process command line
#
# Pass all arguemnts before 'operation' to cURL except the ones we override
#
take_user=false
take_host=false
take_accept_header=false
take_contenttype_header=false

for key in "$@"; do
# Take the value of -u|--user argument
if [[ "$take_user" = true ]]; then
    basic_auth_credential="$key"
    take_user=false
    continue
fi
# Take the value of --host argument
if [[ "$take_host" = true ]]; then
    host="$key"
    take_host=false
    continue
fi
# Take the value of --accept argument
if [[ "$take_accept_header" = true ]]; then
    header_accept=$(lookup_mime_type "$key")
    take_accept_header=false
    continue
fi
# Take the value of --content-type argument
if [[ "$take_contenttype_header" = true ]]; then
    header_content_type=$(lookup_mime_type "$key")
    take_contenttype_header=false
    continue
fi
case $key in
    -h|--help)
    if [[ "x$operation" == "x" ]]; then
        print_help
        exit 0
    else
        eval "print_${operation}_help"
        exit 0
    fi
    ;;
    -V|--version)
    print_version
    exit 0
    ;;
    --about)
    print_about
    exit 0
    ;;
    -u|--user)
    take_user=true
    ;;
    --host)
    take_host=true
    ;;
    --force)
    force=true
    ;;
    -ac|--accept)
    take_accept_header=true
    ;;
    -ct|--content-type)
    take_contenttype_header=true
    ;;
    --dry-run)
    print_curl=true
    ;;
    tokenGet)
    operation="tokenGet"
    ;;
    addPost)
    operation="addPost"
    ;;
    listPost)
    operation="listPost"
    ;;
    setDelete)
    operation="setDelete"
    ;;
    setPost)
    operation="setPost"
    ;;
    *==*)
    # Parse body arguments and convert them into top level
    # JSON properties passed in the body content as strings
    if [[ "$operation" ]]; then
        IFS='==' read body_key sep body_value <<< "$key"
        body_parameters[${body_key}]="\"${body_value}\""
    fi
    ;;
    *:=*)
    # Parse body arguments and convert them into top level
    # JSON properties passed in the body content without qoutes
    if [[ "$operation" ]]; then
        IFS=':=' read body_key sep body_value <<< "$key"
        body_parameters[${body_key}]=${body_value}
    fi
    ;;
    *:*)
    # Parse header arguments and convert them into curl
    # only after the operation argument
    if [[ "$operation" ]]; then
        IFS=':' read header_name header_value <<< "$key"
        header_arguments[$header_name]=$header_value
    else
        curl_arguments+=" $key"
    fi
    ;;
    -)
    body_content_temp_file=$(mktemp)
    cat - > $body_content_temp_file
    ;;
    *=*)
    # Parse operation arguments and convert them into curl
    # only after the operation argument
    if [[ "$operation" ]]; then
        IFS='=' read parameter_name parameter_value <<< "$key"
        if [[ -z "${operation_parameters[$parameter_name]+foo}" ]]; then
            operation_parameters[$parameter_name]=$(url_escape "${parameter_value}")
        else
            operation_parameters[$parameter_name]+=":::"$(url_escape "${parameter_value}")
        fi
    else
        curl_arguments+=" $key"
    fi
    ;;
    *)
    # If we are before the operation, treat the arguments as cURL arguments
    if [[ "x$operation" == "x" ]]; then
        # Maintain quotes around cURL arguments if necessary
        space_regexp="[[:space:]]"
        if [[ $key =~ $space_regexp ]]; then
            curl_arguments+=" \"$key\""
        else
            curl_arguments+=" $key"
        fi
    fi
    ;;
esac
done


# Check if user provided host name
if [[ -z "$host" ]]; then
    echo "Error: No hostname provided!!!"
    echo "Check usage: '${script_name} --help'"
    exit 1
fi

# Check if user specified operation ID
if [[ -z "$operation" ]]; then
    echo "Error: No operation specified!"
    echo "Check available operations: '${script_name} --help'"
    exit 1
fi


# Run cURL command based on the operation ID
case $operation in
    tokenGet)
    call_tokenGet
    ;;
    addPost)
    call_addPost
    ;;
    listPost)
    call_listPost
    ;;
    setDelete)
    call_setDelete
    ;;
    setPost)
    call_setPost
    ;;
    *)
    echo "Error: Unknown operation: $operation"
    echo ""
    print_help
    exit 1
esac
