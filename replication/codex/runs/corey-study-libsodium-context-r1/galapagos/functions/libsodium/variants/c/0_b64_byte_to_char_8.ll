; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r1/functions/libsodium/variants/c/0_b64_byte_to_char_8.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r1/functions/libsodium/variants/c/0_b64_byte_to_char_8.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_byte_to_char(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_byte_to_char(i32 noundef %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  %upper = alloca i32, align 4
  %lower = alloca i32, align 4
  %digit = alloca i32, align 4
  %plus = alloca i32, align 4
  %slash = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %add = add i32 %0, 65
  %and = and i32 %add, 255
  store i32 %and, ptr %upper, align 4
  %1 = load i32, ptr %x.addr, align 4
  %add1 = add i32 %1, 71
  %and2 = and i32 %add1, 255
  store i32 %and2, ptr %lower, align 4
  %2 = load i32, ptr %x.addr, align 4
  %add3 = add i32 %2, -4
  %and4 = and i32 %add3, 255
  store i32 %and4, ptr %digit, align 4
  store i32 43, ptr %plus, align 4
  store i32 47, ptr %slash, align 4
  %3 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %3, 26
  %shr = lshr i32 %sub, 8
  store i32 %shr, ptr %a, align 4
  %4 = load i32, ptr %x.addr, align 4
  %sub5 = sub i32 %4, 52
  %shr6 = lshr i32 %sub5, 8
  store i32 %shr6, ptr %b, align 4
  %5 = load i32, ptr %x.addr, align 4
  %sub7 = sub i32 %5, 62
  %shr8 = lshr i32 %sub7, 8
  store i32 %shr8, ptr %c, align 4
  %6 = load i32, ptr %a, align 4
  %7 = load i32, ptr %upper, align 4
  %and9 = and i32 %7, %6
  store i32 %and9, ptr %upper, align 4
  %8 = load i32, ptr %a, align 4
  %not = xor i32 %8, -1
  %9 = load i32, ptr %b, align 4
  %and10 = and i32 %not, %9
  %10 = load i32, ptr %lower, align 4
  %and11 = and i32 %10, %and10
  store i32 %and11, ptr %lower, align 4
  %11 = load i32, ptr %b, align 4
  %not12 = xor i32 %11, -1
  %12 = load i32, ptr %c, align 4
  %and13 = and i32 %not12, %12
  %13 = load i32, ptr %digit, align 4
  %and14 = and i32 %13, %and13
  store i32 %and14, ptr %digit, align 4
  %14 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %14, 62
  %sub15 = sub i32 0, %xor
  %shr16 = lshr i32 %sub15, 8
  %not17 = xor i32 %shr16, -1
  %15 = load i32, ptr %plus, align 4
  %and18 = and i32 %15, %not17
  store i32 %and18, ptr %plus, align 4
  %16 = load i32, ptr %x.addr, align 4
  %xor19 = xor i32 %16, 63
  %sub20 = sub i32 0, %xor19
  %shr21 = lshr i32 %sub20, 8
  %not22 = xor i32 %shr21, -1
  %17 = load i32, ptr %slash, align 4
  %and23 = and i32 %17, %not22
  store i32 %and23, ptr %slash, align 4
  %18 = load i32, ptr %upper, align 4
  %19 = load i32, ptr %lower, align 4
  %or = or i32 %18, %19
  %20 = load i32, ptr %digit, align 4
  %or24 = or i32 %or, %20
  %21 = load i32, ptr %plus, align 4
  %or25 = or i32 %or24, %21
  %22 = load i32, ptr %slash, align 4
  %or26 = or i32 %or25, %22
  ret i32 %or26
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
