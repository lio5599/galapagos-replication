; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r3/functions/libsodium/variants/c/2_b64_char_to_byte_9.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r3/functions/libsodium/variants/c/2_b64_char_to_byte_9.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_char_to_byte(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_char_to_byte(i32 noundef %c) #0 {
entry:
  %c.addr = alloca i32, align 4
  %u = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %d = alloca i32, align 4
  %p = alloca i32, align 4
  %s = alloca i32, align 4
  %x = alloca i32, align 4
  %zero_mask = alloca i32, align 4
  %correction = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %not = xor i32 %sub, -1
  %shr = lshr i32 %not, 8
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %not2 = xor i32 %sub1, -1
  %shr3 = lshr i32 %not2, 8
  %and = and i32 %shr, %shr3
  %3 = load i32, ptr %u, align 4
  %sub4 = sub i32 %3, 65
  %and5 = and i32 %and, %sub4
  %and6 = and i32 %and5, 255
  store i32 %and6, ptr %a, align 4
  %4 = load i32, ptr %u, align 4
  %sub7 = sub i32 %4, 97
  %not8 = xor i32 %sub7, -1
  %shr9 = lshr i32 %not8, 8
  %5 = load i32, ptr %u, align 4
  %sub10 = sub i32 122, %5
  %not11 = xor i32 %sub10, -1
  %shr12 = lshr i32 %not11, 8
  %and13 = and i32 %shr9, %shr12
  %6 = load i32, ptr %u, align 4
  %sub14 = sub i32 %6, 71
  %and15 = and i32 %and13, %sub14
  %and16 = and i32 %and15, 255
  store i32 %and16, ptr %b, align 4
  %7 = load i32, ptr %u, align 4
  %sub17 = sub i32 %7, 48
  %not18 = xor i32 %sub17, -1
  %shr19 = lshr i32 %not18, 8
  %8 = load i32, ptr %u, align 4
  %sub20 = sub i32 57, %8
  %not21 = xor i32 %sub20, -1
  %shr22 = lshr i32 %not21, 8
  %and23 = and i32 %shr19, %shr22
  %9 = load i32, ptr %u, align 4
  %sub24 = sub i32 %9, -4
  %and25 = and i32 %and23, %sub24
  %and26 = and i32 %and25, 255
  store i32 %and26, ptr %d, align 4
  %10 = load i32, ptr %u, align 4
  %xor = xor i32 %10, 43
  %sub27 = sub i32 0, %xor
  %not28 = xor i32 %sub27, -1
  %shr29 = lshr i32 %not28, 8
  %and30 = and i32 %shr29, 62
  store i32 %and30, ptr %p, align 4
  %11 = load i32, ptr %u, align 4
  %xor31 = xor i32 %11, 47
  %sub32 = sub i32 0, %xor31
  %not33 = xor i32 %sub32, -1
  %shr34 = lshr i32 %not33, 8
  %and35 = and i32 %shr34, 63
  store i32 %and35, ptr %s, align 4
  %12 = load i32, ptr %a, align 4
  %13 = load i32, ptr %b, align 4
  %or = or i32 %12, %13
  %14 = load i32, ptr %d, align 4
  %15 = load i32, ptr %p, align 4
  %16 = load i32, ptr %s, align 4
  %or36 = or i32 %15, %16
  %or37 = or i32 %14, %or36
  %or38 = or i32 %or, %or37
  store i32 %or38, ptr %x, align 4
  %17 = load i32, ptr %x, align 4
  %sub39 = sub i32 0, %17
  %shr40 = lshr i32 %sub39, 8
  %not41 = xor i32 %shr40, -1
  %and42 = and i32 %not41, 255
  store i32 %and42, ptr %zero_mask, align 4
  %18 = load i32, ptr %u, align 4
  %xor43 = xor i32 %18, 65
  %sub44 = sub i32 0, %xor43
  %shr45 = lshr i32 %sub44, 8
  %and46 = and i32 %shr45, 255
  store i32 %and46, ptr %correction, align 4
  %19 = load i32, ptr %x, align 4
  %20 = load i32, ptr %zero_mask, align 4
  %21 = load i32, ptr %correction, align 4
  %and47 = and i32 %20, %21
  %or48 = or i32 %19, %and47
  ret i32 %or48
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0 (git@github.com:llvm/llvm-project.git 1a7a00bdc99fa2b2ca19ecd2d1069991b3c1006b)"}
