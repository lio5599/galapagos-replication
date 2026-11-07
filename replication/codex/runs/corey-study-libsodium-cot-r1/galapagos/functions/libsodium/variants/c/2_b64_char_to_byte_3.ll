; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r1/functions/libsodium/variants/c/2_b64_char_to_byte_3.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r1/functions/libsodium/variants/c/2_b64_char_to_byte_3.c"
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
  %inverse = alloca i32, align 4
  %mask = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  store i32 -1, ptr %inverse, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %or = or i32 %sub, %sub1
  %shr = lshr i32 %or, 8
  %and = and i32 %shr, 255
  %xor = xor i32 255, %and
  store i32 %xor, ptr %mask, align 4
  %3 = load i32, ptr %mask, align 4
  %4 = load i32, ptr %u, align 4
  %sub2 = sub i32 %4, 65
  %and3 = and i32 %3, %sub2
  %not = xor i32 %and3, -1
  %5 = load i32, ptr %inverse, align 4
  %and4 = and i32 %5, %not
  store i32 %and4, ptr %inverse, align 4
  %6 = load i32, ptr %u, align 4
  %sub5 = sub i32 %6, 97
  %7 = load i32, ptr %u, align 4
  %sub6 = sub i32 122, %7
  %or7 = or i32 %sub5, %sub6
  %shr8 = lshr i32 %or7, 8
  %and9 = and i32 %shr8, 255
  %xor10 = xor i32 255, %and9
  store i32 %xor10, ptr %mask, align 4
  %8 = load i32, ptr %mask, align 4
  %9 = load i32, ptr %u, align 4
  %sub11 = sub i32 %9, 97
  %add = add i32 %sub11, 26
  %and12 = and i32 %8, %add
  %not13 = xor i32 %and12, -1
  %10 = load i32, ptr %inverse, align 4
  %and14 = and i32 %10, %not13
  store i32 %and14, ptr %inverse, align 4
  %11 = load i32, ptr %u, align 4
  %sub15 = sub i32 %11, 48
  %12 = load i32, ptr %u, align 4
  %sub16 = sub i32 57, %12
  %or17 = or i32 %sub15, %sub16
  %shr18 = lshr i32 %or17, 8
  %and19 = and i32 %shr18, 255
  %xor20 = xor i32 255, %and19
  store i32 %xor20, ptr %mask, align 4
  %13 = load i32, ptr %mask, align 4
  %14 = load i32, ptr %u, align 4
  %sub21 = sub i32 %14, 48
  %add22 = add i32 %sub21, 52
  %and23 = and i32 %13, %add22
  %not24 = xor i32 %and23, -1
  %15 = load i32, ptr %inverse, align 4
  %and25 = and i32 %15, %not24
  store i32 %and25, ptr %inverse, align 4
  %16 = load i32, ptr %u, align 4
  %xor26 = xor i32 %16, 43
  %sub27 = sub i32 0, %xor26
  %shr28 = lshr i32 %sub27, 8
  %and29 = and i32 %shr28, 255
  %xor30 = xor i32 255, %and29
  store i32 %xor30, ptr %mask, align 4
  %17 = load i32, ptr %mask, align 4
  %and31 = and i32 %17, 62
  %not32 = xor i32 %and31, -1
  %18 = load i32, ptr %inverse, align 4
  %and33 = and i32 %18, %not32
  store i32 %and33, ptr %inverse, align 4
  %19 = load i32, ptr %u, align 4
  %xor34 = xor i32 %19, 47
  %sub35 = sub i32 0, %xor34
  %shr36 = lshr i32 %sub35, 8
  %and37 = and i32 %shr36, 255
  %xor38 = xor i32 255, %and37
  store i32 %xor38, ptr %mask, align 4
  %20 = load i32, ptr %mask, align 4
  %and39 = and i32 %20, 63
  %not40 = xor i32 %and39, -1
  %21 = load i32, ptr %inverse, align 4
  %and41 = and i32 %21, %not40
  store i32 %and41, ptr %inverse, align 4
  %22 = load i32, ptr %inverse, align 4
  %not42 = xor i32 %22, -1
  %and43 = and i32 %not42, 255
  store i32 %and43, ptr %x, align 4
  %23 = load i32, ptr %x, align 4
  %24 = load i32, ptr %x, align 4
  %sub44 = sub i32 0, %24
  %shr45 = lshr i32 %sub44, 8
  %and46 = and i32 %shr45, 255
  %xor47 = xor i32 255, %and46
  %25 = load i32, ptr %u, align 4
  %xor48 = xor i32 %25, 65
  %sub49 = sub i32 0, %xor48
  %shr50 = lshr i32 %sub49, 8
  %and51 = and i32 %shr50, 255
  %and52 = and i32 %xor47, %and51
  %or53 = or i32 %23, %and52
  ret i32 %or53
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
