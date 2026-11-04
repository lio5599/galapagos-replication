; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_9.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_9.c"
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
  %ge_A = alloca i32, align 4
  %le_Z = alloca i32, align 4
  %ge_a = alloca i32, align 4
  %le_z = alloca i32, align 4
  %ge_0 = alloca i32, align 4
  %le_9 = alloca i32, align 4
  %eq_p = alloca i32, align 4
  %eq_s = alloca i32, align 4
  %ne_A = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %shr = lshr i32 %sub, 8
  %not = xor i32 %shr, -1
  %and = and i32 255, %not
  store i32 %and, ptr %ge_A, align 4
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %shr2 = lshr i32 %sub1, 8
  %not3 = xor i32 %shr2, -1
  %and4 = and i32 255, %not3
  store i32 %and4, ptr %le_Z, align 4
  %3 = load i32, ptr %u, align 4
  %sub5 = sub i32 %3, 97
  %shr6 = lshr i32 %sub5, 8
  %not7 = xor i32 %shr6, -1
  %and8 = and i32 255, %not7
  store i32 %and8, ptr %ge_a, align 4
  %4 = load i32, ptr %u, align 4
  %sub9 = sub i32 122, %4
  %shr10 = lshr i32 %sub9, 8
  %not11 = xor i32 %shr10, -1
  %and12 = and i32 255, %not11
  store i32 %and12, ptr %le_z, align 4
  %5 = load i32, ptr %u, align 4
  %sub13 = sub i32 %5, 48
  %shr14 = lshr i32 %sub13, 8
  %not15 = xor i32 %shr14, -1
  %and16 = and i32 255, %not15
  store i32 %and16, ptr %ge_0, align 4
  %6 = load i32, ptr %u, align 4
  %sub17 = sub i32 57, %6
  %shr18 = lshr i32 %sub17, 8
  %not19 = xor i32 %shr18, -1
  %and20 = and i32 255, %not19
  store i32 %and20, ptr %le_9, align 4
  %7 = load i32, ptr %u, align 4
  %xor = xor i32 %7, 43
  %sub21 = sub i32 0, %xor
  %shr22 = lshr i32 %sub21, 8
  %not23 = xor i32 %shr22, -1
  %and24 = and i32 255, %not23
  store i32 %and24, ptr %eq_p, align 4
  %8 = load i32, ptr %u, align 4
  %xor25 = xor i32 %8, 47
  %sub26 = sub i32 0, %xor25
  %shr27 = lshr i32 %sub26, 8
  %not28 = xor i32 %shr27, -1
  %and29 = and i32 255, %not28
  store i32 %and29, ptr %eq_s, align 4
  %9 = load i32, ptr %u, align 4
  %xor30 = xor i32 %9, 65
  %sub31 = sub i32 0, %xor30
  %shr32 = lshr i32 %sub31, 8
  %and33 = and i32 255, %shr32
  store i32 %and33, ptr %ne_A, align 4
  %10 = load i32, ptr %ge_A, align 4
  %11 = load i32, ptr %le_Z, align 4
  %and34 = and i32 %10, %11
  %12 = load i32, ptr %u, align 4
  %sub35 = sub i32 %12, 65
  %and36 = and i32 %and34, %sub35
  store i32 %and36, ptr %x, align 4
  %13 = load i32, ptr %ge_a, align 4
  %14 = load i32, ptr %le_z, align 4
  %and37 = and i32 %13, %14
  %15 = load i32, ptr %u, align 4
  %sub38 = sub i32 %15, 71
  %and39 = and i32 %and37, %sub38
  %16 = load i32, ptr %x, align 4
  %or = or i32 %16, %and39
  store i32 %or, ptr %x, align 4
  %17 = load i32, ptr %ge_0, align 4
  %18 = load i32, ptr %le_9, align 4
  %and40 = and i32 %17, %18
  %19 = load i32, ptr %u, align 4
  %add = add i32 %19, 4
  %and41 = and i32 %and40, %add
  %20 = load i32, ptr %x, align 4
  %or42 = or i32 %20, %and41
  store i32 %or42, ptr %x, align 4
  %21 = load i32, ptr %eq_p, align 4
  %and43 = and i32 %21, 62
  %22 = load i32, ptr %x, align 4
  %or44 = or i32 %22, %and43
  store i32 %or44, ptr %x, align 4
  %23 = load i32, ptr %eq_s, align 4
  %and45 = and i32 %23, 63
  %24 = load i32, ptr %x, align 4
  %or46 = or i32 %24, %and45
  store i32 %or46, ptr %x, align 4
  %25 = load i32, ptr %x, align 4
  %26 = load i32, ptr %x, align 4
  %sub47 = sub i32 0, %26
  %shr48 = lshr i32 %sub47, 8
  %not49 = xor i32 %shr48, -1
  %and50 = and i32 255, %not49
  %27 = load i32, ptr %ne_A, align 4
  %and51 = and i32 %and50, %27
  %or52 = or i32 %25, %and51
  ret i32 %or52
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
