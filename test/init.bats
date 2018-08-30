#!/usr/bin/env bats

load test_helper

@test "init creates tidel path directory if it does not exist" {
  rm -rf "${TIDEL_PATH}"
  run tidel init
  [ "${status}" -eq 0 ]
  [ -d "${TIDEL_PATH}" ]
}

@test "init creates scripts directory if it does not exist" {
  rm -rf "${TIDEL_PATH}/scripts"
  run tidel init
  [ "${status}" -eq 0 ]
  [ -d "${TIDEL_PATH}/scripts" ]
}

@test "init does not create tidel path directory if it exist" {
  mkdir -p "${TIDEL_PATH}"
  run tidel init
  [ "${status}" -eq 0 ]
  echo "${output}" | grep "Warn: Tidel is already initialized"
}

@test "init does not create scripts directory if it exist" {
  mkdir -p "${TIDEL_PATH}/scripts"
  run tidel init
  [ "${status}" -eq 0 ]
  echo "${output}" | grep "Warn: Tidel is already initialized"
}
