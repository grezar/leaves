#!/usr/bin/env bats

load test_helper

read() {
  case $COUNT in
    0 )
      COMMAND="echo hello world"
      COUNT=$((COUNT += 1))
      ;;
    1 )
      COMMAND="echo tidel test"
      COUNT=$((COUNT += 1))
      ;;
    2 )
      COMMAND="save!"
      ;;
    * )
  esac
}

@test "add creates a new tidel scripts file" {
  export -f read
  rm -f "${TIDEL_SCRIPTS_PATH}/${SCRIPTS_NAME}"
  run tidel add "${SCRIPTS_NAME}"
  [ "${status}" -eq 0 ]
  [ -f "${TIDEL_SCRIPTS_PATH}/${SCRIPTS_NAME}" ]
}

@test "add write tidel scripts to a file" {
  export -f read
  rm -f "${TIDEL_SCRIPTS_PATH}/${SCRIPTS_NAME}"
  run tidel add "${SCRIPTS_NAME}"
  [ "${status}" -eq 0 ]
  [ $(cat "${TIDEL_SCRIPTS_PATH}/${SCRIPTS_NAME}" | wc -l) -eq 2 ]
  [ $(tail -n 1 "${TIDEL_SCRIPTS_PATH}/${SCRIPTS_NAME}") = "echo tidel test" ]
}
