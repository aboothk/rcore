use crate::sbi::set_timer;
use riscv::register::{
    time,
    sie
};
//当前已触发多少次时钟中断
pub static mut TICKS: usize =0;
//触发时钟中断时间间隔
//数值一般为cpu频率的1%，防止过多占用cpu资源
static TIMEBASE: u64=100000;
pub fn init(){
    unsafe{
        TICKS=0;
        sie::set_stimer();
    }
    clock_set_next_event();
    println!("+++++setup timer! +++++");
}

pub fn clock_set_next_event(){
    set_timer(get_cycle()+TIMEBASE);
}

fn get_cycle()->u64{
    time::read() as u64
}
