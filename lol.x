PROVIDE(_defmt_panic = __defmt_default_panic);

MEMORY
{
  FLASH : ORIGIN = 0x00000000, LENGTH = 1024K
  RAM   : ORIGIN = 0x20000000, LENGTH = 256K
}

SECTIONS
{
  .text :
  {
    *(.text .text.*);
  } > FLASH

  .rodata : ALIGN(4)
  {
    *(.rodata .rodata.*);
  } > FLASH

  .data : ALIGN(4)
  {
    *(.data .data.*);
  } > RAM AT>FLASH

  .bss (NOLOAD) : ALIGN(4)
  {
    *(.bss .bss.*);
  } > RAM

  /* ## Discarded sections */
  /DISCARD/ :
  {
    /* Unused exception related info that only wastes space */
    *(.ARM.exidx);
    *(.ARM.exidx.*);
    *(.ARM.extab.*);
  }
}
