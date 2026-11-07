; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r2/functions/libsodium/variants/c/2_b64_char_to_byte_4.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r2/functions/libsodium/variants/c/2_b64_char_to_byte_4.c"
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
  %ua = alloca i32, align 4
  %la = alloca i32, align 4
  %da = alloca i32, align 4
  %upper = alloca i32, align 4
  %lower = alloca i32, align 4
  %digit = alloca i32, align 4
  %x = alloca i32, align 4
  %correction = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  store i32 %sub, ptr %ua, align 4
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 %2, 97
  store i32 %sub1, ptr %la, align 4
  %3 = load i32, ptr %u, align 4
  %sub2 = sub i32 %3, 48
  store i32 %sub2, ptr %da, align 4
  %4 = load i32, ptr %ua, align 4
  %and = and i32 %4, 255
  store i32 %and, ptr %upper, align 4
  %5 = load i32, ptr %la, align 4
  %add = add i32 %5, 26
  %and3 = and i32 %add, 255
  store i32 %and3, ptr %lower, align 4
  %6 = load i32, ptr %da, align 4
  %add4 = add i32 %6, 52
  %and5 = and i32 %add4, 255
  store i32 %and5, ptr %digit, align 4
  %7 = load i32, ptr %ua, align 4
  %shr = lshr i32 %7, 8
  %not = xor i32 %shr, -1
  %8 = load i32, ptr %upper, align 4
  %and6 = and i32 %8, %not
  store i32 %and6, ptr %upper, align 4
  %9 = load i32, ptr %u, align 4
  %sub7 = sub i32 90, %9
  %shr8 = lshr i32 %sub7, 8
  %not9 = xor i32 %shr8, -1
  %10 = load i32, ptr %upper, align 4
  %and10 = and i32 %10, %not9
  store i32 %and10, ptr %upper, align 4
  %11 = load i32, ptr %la, align 4
  %shr11 = lshr i32 %11, 8
  %not12 = xor i32 %shr11, -1
  %12 = load i32, ptr %lower, align 4
  %and13 = and i32 %12, %not12
  store i32 %and13, ptr %lower, align 4
  %13 = load i32, ptr %u, align 4
  %sub14 = sub i32 122, %13
  %shr15 = lshr i32 %sub14, 8
  %not16 = xor i32 %shr15, -1
  %14 = load i32, ptr %lower, align 4
  %and17 = and i32 %14, %not16
  store i32 %and17, ptr %lower, align 4
  %15 = load i32, ptr %da, align 4
  %shr18 = lshr i32 %15, 8
  %not19 = xor i32 %shr18, -1
  %16 = load i32, ptr %digit, align 4
  %and20 = and i32 %16, %not19
  store i32 %and20, ptr %digit, align 4
  %17 = load i32, ptr %u, align 4
  %sub21 = sub i32 57, %17
  %shr22 = lshr i32 %sub21, 8
  %not23 = xor i32 %shr22, -1
  %18 = load i32, ptr %digit, align 4
  %and24 = and i32 %18, %not23
  store i32 %and24, ptr %digit, align 4
  %19 = load i32, ptr %upper, align 4
  %20 = load i32, ptr %lower, align 4
  %or = or i32 %19, %20
  %21 = load i32, ptr %digit, align 4
  %or25 = or i32 %or, %21
  store i32 %or25, ptr %x, align 4
  %22 = load i32, ptr %u, align 4
  %xor = xor i32 %22, 43
  %sub26 = sub i32 0, %xor
  %shr27 = lshr i32 %sub26, 8
  %not28 = xor i32 %shr27, -1
  %and29 = and i32 %not28, 62
  %23 = load i32, ptr %x, align 4
  %or30 = or i32 %23, %and29
  store i32 %or30, ptr %x, align 4
  %24 = load i32, ptr %u, align 4
  %xor31 = xor i32 %24, 47
  %sub32 = sub i32 0, %xor31
  %shr33 = lshr i32 %sub32, 8
  %not34 = xor i32 %shr33, -1
  %and35 = and i32 %not34, 63
  %25 = load i32, ptr %x, align 4
  %or36 = or i32 %25, %and35
  store i32 %or36, ptr %x, align 4
  %26 = load i32, ptr %u, align 4
  %xor37 = xor i32 %26, 65
  %sub38 = sub i32 0, %xor37
  %shr39 = lshr i32 %sub38, 8
  %and40 = and i32 %shr39, 255
  store i32 %and40, ptr %correction, align 4
  %27 = load i32, ptr %x, align 4
  %sub41 = sub i32 0, %27
  %shr42 = lshr i32 %sub41, 8
  %not43 = xor i32 %shr42, -1
  %28 = load i32, ptr %correction, align 4
  %and44 = and i32 %28, %not43
  store i32 %and44, ptr %correction, align 4
  %29 = load i32, ptr %x, align 4
  %30 = load i32, ptr %correction, align 4
  %or45 = or i32 %29, %30
  ret i32 %or45
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
