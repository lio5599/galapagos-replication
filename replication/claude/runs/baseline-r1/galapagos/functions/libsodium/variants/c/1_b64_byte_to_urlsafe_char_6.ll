; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_6.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_6.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_byte_to_urlsafe_char(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_byte_to_urlsafe_char(i32 noundef %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  %n62 = alloca i32, align 4
  %n63 = alloca i32, align 4
  %lt26 = alloca i32, align 4
  %lt52 = alloca i32, align 4
  %lt62 = alloca i32, align 4
  %is62 = alloca i32, align 4
  %is63 = alloca i32, align 4
  %upper = alloca i32, align 4
  %lower = alloca i32, align 4
  %digit = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %0, 62
  store i32 %xor, ptr %n62, align 4
  %1 = load i32, ptr %x.addr, align 4
  %xor1 = xor i32 %1, 63
  store i32 %xor1, ptr %n63, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %2, 26
  %shr = lshr i32 %sub, 8
  %and = and i32 %shr, 255
  store i32 %and, ptr %lt26, align 4
  %3 = load i32, ptr %x.addr, align 4
  %sub2 = sub i32 %3, 52
  %shr3 = lshr i32 %sub2, 8
  %and4 = and i32 %shr3, 255
  store i32 %and4, ptr %lt52, align 4
  %4 = load i32, ptr %x.addr, align 4
  %sub5 = sub i32 %4, 62
  %shr6 = lshr i32 %sub5, 8
  %and7 = and i32 %shr6, 255
  store i32 %and7, ptr %lt62, align 4
  %5 = load i32, ptr %n62, align 4
  %sub8 = sub i32 0, %5
  %shr9 = lshr i32 %sub8, 8
  %and10 = and i32 %shr9, 255
  %xor11 = xor i32 %and10, 255
  store i32 %xor11, ptr %is62, align 4
  %6 = load i32, ptr %n63, align 4
  %sub12 = sub i32 0, %6
  %shr13 = lshr i32 %sub12, 8
  %and14 = and i32 %shr13, 255
  %xor15 = xor i32 %and14, 255
  store i32 %xor15, ptr %is63, align 4
  %7 = load i32, ptr %lt26, align 4
  %8 = load i32, ptr %x.addr, align 4
  %add = add i32 %8, 65
  %and16 = and i32 %7, %add
  store i32 %and16, ptr %upper, align 4
  %9 = load i32, ptr %lt26, align 4
  %not = xor i32 %9, -1
  %10 = load i32, ptr %lt52, align 4
  %and17 = and i32 %not, %10
  %and18 = and i32 %and17, 255
  %11 = load i32, ptr %x.addr, align 4
  %add19 = add i32 %11, 71
  %and20 = and i32 %and18, %add19
  store i32 %and20, ptr %lower, align 4
  %12 = load i32, ptr %lt52, align 4
  %not21 = xor i32 %12, -1
  %13 = load i32, ptr %lt62, align 4
  %and22 = and i32 %not21, %13
  %and23 = and i32 %and22, 255
  %14 = load i32, ptr %x.addr, align 4
  %add24 = add i32 %14, -4
  %and25 = and i32 %and23, %add24
  store i32 %and25, ptr %digit, align 4
  %15 = load i32, ptr %upper, align 4
  %16 = load i32, ptr %lower, align 4
  %or = or i32 %15, %16
  %17 = load i32, ptr %digit, align 4
  %or26 = or i32 %or, %17
  %18 = load i32, ptr %is62, align 4
  %and27 = and i32 %18, 45
  %or28 = or i32 %or26, %and27
  %19 = load i32, ptr %is63, align 4
  %and29 = and i32 %19, 95
  %or30 = or i32 %or28, %and29
  ret i32 %or30
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
