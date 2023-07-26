#ifndef BLUETOOTH_DRIVER_H__
#define BLUETOOTH_DRIVER_H__

#include <stdint.h>
#include <string.h>


#include "nordic_common.h"
#include "nrf.h"
#include "nrf_sdm.h"
#include "app_error.h"
#include "ble.h"
#include "ble_err.h"
#include "ble_hci.h"
#include "ble_srv_common.h"
#include "ble_advdata.h"
#include "ble_advertising.h"
#include "ble_conn_params.h"
#include "nrf_sdh.h"
#include "nrf_sdh_ble.h"
#include "nrf_sdh_soc.h"
#include "app_timer.h"
#include "peer_manager.h"
#include "peer_manager_handler.h"
#include "fds.h"
#include "nrf_ble_gatt.h"
#include "nrf_ble_lesc.h"
#include "nrf_ble_qwr.h"
#include "ble_conn_state.h"
#include "nrf_pwr_mgmt.h"

#include "log_driver.h"

#ifdef __cplusplus
extern "C" {
#endif

void bluetooth_init(void);
void power_management_init(void);
void idle_state_handle(void);
void advertising_start(void);
void disconnect(void);
void restart_adv_without_whitelist(void);

#ifdef __cplusplus
}
#endif

#endif // BLUETOOTH_DRIVER_H__