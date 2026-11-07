; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r1/functions/libsodium/variants/c/2_b64_char_to_byte_8.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r1/functions/libsodium/variants/c/2_b64_char_to_byte_8.c"
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
  %fallback = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 %2, 65
  %3 = load i32, ptr %u, align 4
  %sub2 = sub i32 90, %3
  %or = or i32 %sub1, %sub2
  %shr = lshr i32 %or, 8
  %not = xor i32 %shr, -1
  %and = and i32 %sub, %not
  store i32 %and, ptr %a, align 4
  %4 = load i32, ptr %u, align 4
  %sub3 = sub i32 %4, 97
  %add = add i32 %sub3, 26
  %5 = load i32, ptr %u, align 4
  %sub4 = sub i32 %5, 97
  %6 = load i32, ptr %u, align 4
  %sub5 = sub i32 122, %6
  %or6 = or i32 %sub4, %sub5
  %shr7 = lshr i32 %or6, 8
  %not8 = xor i32 %shr7, -1
  %and9 = and i32 %add, %not8
  store i32 %and9, ptr %b, align 4
  %7 = load i32, ptr %u, align 4
  %sub10 = sub i32 %7, 48
  %add11 = add i32 %sub10, 52
  %8 = load i32, ptr %u, align 4
  %sub12 = sub i32 %8, 48
  %9 = load i32, ptr %u, align 4
  %sub13 = sub i32 57, %9
  %or14 = or i32 %sub12, %sub13
  %shr15 = lshr i32 %or14, 8
  %not16 = xor i32 %shr15, -1
  %and17 = and i32 %add11, %not16
  store i32 %and17, ptr %d, align 4
  %10 = load i32, ptr %u, align 4
  %xor = xor i32 %10, 43
  %sub18 = sub i32 0, %xor
  %shr19 = lshr i32 %sub18, 8
  %not20 = xor i32 %shr19, -1
  %and21 = and i32 62, %not20
  store i32 %and21, ptr %p, align 4
  %11 = load i32, ptr %u, align 4
  %xor22 = xor i32 %11, 47
  %sub23 = sub i32 0, %xor22
  %shr24 = lshr i32 %sub23, 8
  %not25 = xor i32 %shr24, -1
  %and26 = and i32 63, %not25
  store i32 %and26, ptr %s, align 4
  %12 = load i32, ptr %a, align 4
  %not27 = xor i32 %12, -1
  %13 = load i32, ptr %b, align 4
  %not28 = xor i32 %13, -1
  %and29 = and i32 %not27, %not28
  %14 = load i32, ptr %d, align 4
  %not30 = xor i32 %14, -1
  %and31 = and i32 %and29, %not30
  %15 = load i32, ptr %p, align 4
  %not32 = xor i32 %15, -1
  %and33 = and i32 %and31, %not32
  %16 = load i32, ptr %s, align 4
  %not34 = xor i32 %16, -1
  %and35 = and i32 %and33, %not34
  %not36 = xor i32 %and35, -1
  %and37 = and i32 %not36, 255
  store i32 %and37, ptr %x, align 4
  %17 = load i32, ptr %u, align 4
  %xor38 = xor i32 %17, 65
  %sub39 = sub i32 0, %xor38
  %shr40 = lshr i32 %sub39, 8
  %and41 = and i32 %shr40, 255
  store i32 %and41, ptr %fallback, align 4
  %18 = load i32, ptr %x, align 4
  %19 = load i32, ptr %x, align 4
  %cmp = icmp eq i32 %19, 0
  %conv = zext i1 %cmp to i32
  %20 = load i32, ptr %fallback, align 4
  %mul = mul i32 %conv, %20
  %add42 = add i32 %18, %mul
  ret i32 %add42
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
