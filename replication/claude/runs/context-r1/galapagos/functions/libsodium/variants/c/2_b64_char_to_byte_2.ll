; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_2.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_2.c"
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
  %upper = alloca i32, align 4
  %lower = alloca i32, align 4
  %digit = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  store i32 %sub, ptr %upper, align 4
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 %2, 97
  store i32 %sub1, ptr %lower, align 4
  %3 = load i32, ptr %u, align 4
  %sub2 = sub i32 %3, 48
  store i32 %sub2, ptr %digit, align 4
  %4 = load i32, ptr %upper, align 4
  %5 = load i32, ptr %u, align 4
  %sub3 = sub i32 90, %5
  %or = or i32 %4, %sub3
  %not = xor i32 %or, -1
  %shr = lshr i32 %not, 8
  %and = and i32 %shr, 255
  %6 = load i32, ptr %upper, align 4
  %and4 = and i32 %and, %6
  %7 = load i32, ptr %lower, align 4
  %8 = load i32, ptr %u, align 4
  %sub5 = sub i32 122, %8
  %or6 = or i32 %7, %sub5
  %not7 = xor i32 %or6, -1
  %shr8 = lshr i32 %not7, 8
  %and9 = and i32 %shr8, 255
  %9 = load i32, ptr %u, align 4
  %sub10 = sub i32 %9, 71
  %and11 = and i32 %and9, %sub10
  %or12 = or i32 %and4, %and11
  %10 = load i32, ptr %digit, align 4
  %11 = load i32, ptr %u, align 4
  %sub13 = sub i32 57, %11
  %or14 = or i32 %10, %sub13
  %not15 = xor i32 %or14, -1
  %shr16 = lshr i32 %not15, 8
  %and17 = and i32 %shr16, 255
  %12 = load i32, ptr %u, align 4
  %add = add i32 %12, 4
  %and18 = and i32 %and17, %add
  %or19 = or i32 %or12, %and18
  %13 = load i32, ptr %u, align 4
  %xor = xor i32 %13, 43
  %sub20 = sub i32 0, %xor
  %not21 = xor i32 %sub20, -1
  %shr22 = lshr i32 %not21, 8
  %and23 = and i32 %shr22, 62
  %or24 = or i32 %or19, %and23
  %14 = load i32, ptr %u, align 4
  %xor25 = xor i32 %14, 47
  %sub26 = sub i32 0, %xor25
  %not27 = xor i32 %sub26, -1
  %shr28 = lshr i32 %not27, 8
  %and29 = and i32 %shr28, 63
  %or30 = or i32 %or24, %and29
  store i32 %or30, ptr %x, align 4
  %15 = load i32, ptr %x, align 4
  %16 = load i32, ptr %x, align 4
  %sub31 = sub i32 0, %16
  %not32 = xor i32 %sub31, -1
  %17 = load i32, ptr %u, align 4
  %xor33 = xor i32 %17, 65
  %sub34 = sub i32 0, %xor33
  %and35 = and i32 %not32, %sub34
  %shr36 = lshr i32 %and35, 8
  %and37 = and i32 %shr36, 255
  %or38 = or i32 %15, %and37
  ret i32 %or38
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
