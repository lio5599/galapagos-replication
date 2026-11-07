; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r3/functions/libsodium/variants/c/2_b64_char_to_byte_9.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r3/functions/libsodium/variants/c/2_b64_char_to_byte_9.c"
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
  %x = alloca i32, align 4
  %mask = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %shr = lshr i32 %sub, 8
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %shr2 = lshr i32 %sub1, 8
  %or = or i32 %shr, %shr2
  store i32 %or, ptr %mask, align 4
  %3 = load i32, ptr %u, align 4
  %sub3 = sub i32 %3, 65
  %4 = load i32, ptr %mask, align 4
  %and = and i32 %4, 255
  %sub4 = sub i32 255, %and
  %and5 = and i32 %sub3, %sub4
  store i32 %and5, ptr %x, align 4
  %5 = load i32, ptr %u, align 4
  %sub6 = sub i32 %5, 97
  %shr7 = lshr i32 %sub6, 8
  %6 = load i32, ptr %u, align 4
  %sub8 = sub i32 122, %6
  %shr9 = lshr i32 %sub8, 8
  %or10 = or i32 %shr7, %shr9
  store i32 %or10, ptr %mask, align 4
  %7 = load i32, ptr %u, align 4
  %sub11 = sub i32 %7, 71
  %8 = load i32, ptr %mask, align 4
  %and12 = and i32 %8, 255
  %sub13 = sub i32 255, %and12
  %and14 = and i32 %sub11, %sub13
  %9 = load i32, ptr %x, align 4
  %or15 = or i32 %9, %and14
  store i32 %or15, ptr %x, align 4
  %10 = load i32, ptr %u, align 4
  %sub16 = sub i32 %10, 48
  %shr17 = lshr i32 %sub16, 8
  %11 = load i32, ptr %u, align 4
  %sub18 = sub i32 57, %11
  %shr19 = lshr i32 %sub18, 8
  %or20 = or i32 %shr17, %shr19
  store i32 %or20, ptr %mask, align 4
  %12 = load i32, ptr %u, align 4
  %sub21 = sub i32 %12, -4
  %13 = load i32, ptr %mask, align 4
  %and22 = and i32 %13, 255
  %sub23 = sub i32 255, %and22
  %and24 = and i32 %sub21, %sub23
  %14 = load i32, ptr %x, align 4
  %or25 = or i32 %14, %and24
  store i32 %or25, ptr %x, align 4
  %15 = load i32, ptr %u, align 4
  %xor = xor i32 %15, 43
  %sub26 = sub i32 0, %xor
  %shr27 = lshr i32 %sub26, 8
  %and28 = and i32 %shr27, 255
  store i32 %and28, ptr %mask, align 4
  %16 = load i32, ptr %mask, align 4
  %sub29 = sub i32 255, %16
  %and30 = and i32 62, %sub29
  %17 = load i32, ptr %x, align 4
  %or31 = or i32 %17, %and30
  store i32 %or31, ptr %x, align 4
  %18 = load i32, ptr %u, align 4
  %xor32 = xor i32 %18, 47
  %sub33 = sub i32 0, %xor32
  %shr34 = lshr i32 %sub33, 8
  %and35 = and i32 %shr34, 255
  store i32 %and35, ptr %mask, align 4
  %19 = load i32, ptr %mask, align 4
  %sub36 = sub i32 255, %19
  %and37 = and i32 63, %sub36
  %20 = load i32, ptr %x, align 4
  %or38 = or i32 %20, %and37
  store i32 %or38, ptr %x, align 4
  %21 = load i32, ptr %x, align 4
  %sub39 = sub i32 0, %21
  %shr40 = lshr i32 %sub39, 8
  %and41 = and i32 %shr40, 255
  %sub42 = sub i32 255, %and41
  store i32 %sub42, ptr %mask, align 4
  %22 = load i32, ptr %x, align 4
  %23 = load i32, ptr %mask, align 4
  %24 = load i32, ptr %u, align 4
  %xor43 = xor i32 %24, 65
  %sub44 = sub i32 0, %xor43
  %shr45 = lshr i32 %sub44, 8
  %and46 = and i32 %shr45, 255
  %and47 = and i32 %23, %and46
  %or48 = or i32 %22, %and47
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
