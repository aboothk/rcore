use crate::consts::*;
mod frame_allocator;
use frame_allocator::SEGMENT_TREE_ALLOCATOR as FRAME_ALLOCATOR;
use buddy_system_allocator::LockedHeap;

use riscv::addr::{
    //分别为虚拟地址、物理地址、虚拟页、物理页帧
    VirtAddr,
    PhysAddr,
    Page,
    Frame
};

pub fn init(l: usize, r :usize){
    FRAME_ALLOCATOR.lock().init(l ,r );
    init_heap();
    println!("+++++++setup memory ! +++");
}

fn init_heap(){
    static mut HEAP: [u8; KERNEL_HEAP_SIZE] = [ 0; KERNEL_HEAP_SIZE];
    unsafe{
         DYNAMIC_ALLOCATOR
             .lock()
             .init(HEAP.as_ptr() as usize , KERNEL_HEAP_SIZE);
    }
}
pub fn alloc_frame()->Option<Frame> {
    Some(Frame::of_ppn(FRAME_ALLOCATOR.lock().alloc()))
}

pub fn dealloc_frame(f: Frame){
    FRAME_ALLOCATOR.lock().dealloc(f.number())
}


#[global_allocator]
static DYNAMIC_ALLOCATOR: LockedHeap = LockedHeap::empty();

#[alloc_error_handler]
fn alloc_error_handler(_: core::alloc::Layout) ->!{
    panic!("alloc_error_handler do nothing but panic!");
}
