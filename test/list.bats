#!/usr/bin/env bats

load test_helper

@test "list list tidel scripts under the TIDEL_PATH/scripts directory" {
  rm -rf "${TIDEL_PATH}/scripts/*"
  touch ${TIDEL_PATH}/scripts/first_script
  touch ${TIDEL_PATH}/scripts/middle_script
  touch ${TIDEL_PATH}/scripts/last_script
  run tidel list
  [ "${status}" -eq 0 ]
  [ $(echo "${output}" | wc -l) -eq 3 ]
  [ $(echo "${output}" | grep first_script) ]
  [ $(echo "${output}" | grep middle_script) ]
  [ $(echo "${output}" | grep last_script) ]
}
