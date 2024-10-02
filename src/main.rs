#![no_main]
#![no_std]

#[export_name = "__defmt_default_panic"]
fn default_panic() -> ! {
    core::panic!()
}

#[doc(hidden)]
#[export_name = "main"]
pub unsafe extern "C" fn __cortex_m_rt_main_trampoline() {
    loop {}
}

#[panic_handler]
fn panic(_: &core::panic::PanicInfo) -> ! {
    loop {}
}

#[export_name = "_defmt_panic"]
#[inline(never)]
fn defmt_panic() -> ! {
    loop {}
}
