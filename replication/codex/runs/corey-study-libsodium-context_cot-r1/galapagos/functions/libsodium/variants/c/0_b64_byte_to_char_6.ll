; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r1/functions/libsodium/variants/c/0_b64_byte_to_char_6.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r1/functions/libsodium/variants/c/0_b64_byte_to_char_6.c"
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
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  %result = alloca i32, align 4
  %term = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %shr = lshr i32 %sub, 8
  %and = and i32 %shr, 255
  store i32 %and, ptr %a, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  %shr2 = lshr i32 %sub1, 8
  %and3 = and i32 %shr2, 255
  store i32 %and3, ptr %b, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub4 = sub i32 %2, 62
  %shr5 = lshr i32 %sub4, 8
  %and6 = and i32 %shr5, 255
  store i32 %and6, ptr %c, align 4
  %3 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %3, 62
  %sub7 = sub i32 0, %xor
  %shr8 = lshr i32 %sub7, 8
  %and9 = and i32 %shr8, 255
  %xor10 = xor i32 %and9, 255
  store i32 %xor10, ptr %d, align 4
  %4 = load i32, ptr %x.addr, align 4
  %xor11 = xor i32 %4, 63
  %sub12 = sub i32 0, %xor11
  %shr13 = lshr i32 %sub12, 8
  %and14 = and i32 %shr13, 255
  %xor15 = xor i32 %and14, 255
  store i32 %xor15, ptr %e, align 4
  %5 = load i32, ptr %a, align 4
  %6 = load i32, ptr %x.addr, align 4
  %add = add i32 %6, 65
  %and16 = and i32 %5, %add
  store i32 %and16, ptr %result, align 4
  %7 = load i32, ptr %a, align 4
  %xor17 = xor i32 %7, 255
  %8 = load i32, ptr %b, align 4
  %and18 = and i32 %xor17, %8
  %9 = load i32, ptr %x.addr, align 4
  %add19 = add i32 %9, 71
  %and20 = and i32 %and18, %add19
  store i32 %and20, ptr %term, align 4
  %10 = load i32, ptr %result, align 4
  %11 = load i32, ptr %term, align 4
  %add21 = add i32 %10, %11
  %12 = load i32, ptr %result, align 4
  %13 = load i32, ptr %term, align 4
  %and22 = and i32 %12, %13
  %sub23 = sub i32 %add21, %and22
  store i32 %sub23, ptr %result, align 4
  %14 = load i32, ptr %b, align 4
  %xor24 = xor i32 %14, 255
  %15 = load i32, ptr %c, align 4
  %and25 = and i32 %xor24, %15
  %16 = load i32, ptr %x.addr, align 4
  %add26 = add i32 %16, -4
  %and27 = and i32 %and25, %add26
  store i32 %and27, ptr %term, align 4
  %17 = load i32, ptr %result, align 4
  %18 = load i32, ptr %term, align 4
  %add28 = add i32 %17, %18
  %19 = load i32, ptr %result, align 4
  %20 = load i32, ptr %term, align 4
  %and29 = and i32 %19, %20
  %sub30 = sub i32 %add28, %and29
  store i32 %sub30, ptr %result, align 4
  %21 = load i32, ptr %d, align 4
  %and31 = and i32 %21, 43
  store i32 %and31, ptr %term, align 4
  %22 = load i32, ptr %result, align 4
  %23 = load i32, ptr %term, align 4
  %add32 = add i32 %22, %23
  %24 = load i32, ptr %result, align 4
  %25 = load i32, ptr %term, align 4
  %and33 = and i32 %24, %25
  %sub34 = sub i32 %add32, %and33
  store i32 %sub34, ptr %result, align 4
  %26 = load i32, ptr %e, align 4
  %and35 = and i32 %26, 47
  store i32 %and35, ptr %term, align 4
  %27 = load i32, ptr %result, align 4
  %28 = load i32, ptr %term, align 4
  %add36 = add i32 %27, %28
  %29 = load i32, ptr %result, align 4
  %30 = load i32, ptr %term, align 4
  %and37 = and i32 %29, %30
  %sub38 = sub i32 %add36, %and37
  store i32 %sub38, ptr %result, align 4
  %31 = load i32, ptr %result, align 4
  ret i32 %31
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
