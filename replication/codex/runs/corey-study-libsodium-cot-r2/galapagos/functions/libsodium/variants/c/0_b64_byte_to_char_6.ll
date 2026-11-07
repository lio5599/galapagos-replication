; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r2/functions/libsodium/variants/c/0_b64_byte_to_char_6.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r2/functions/libsodium/variants/c/0_b64_byte_to_char_6.c"
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
  %upper = alloca i32, align 4
  %lower = alloca i32, align 4
  %digit = alloca i32, align 4
  %result = alloca i32, align 4
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
  %add = add i32 %3, 65
  %and7 = and i32 %add, 255
  store i32 %and7, ptr %upper, align 4
  %4 = load i32, ptr %x.addr, align 4
  %add8 = add i32 %4, 71
  %and9 = and i32 %add8, 255
  store i32 %and9, ptr %lower, align 4
  %5 = load i32, ptr %x.addr, align 4
  %add10 = add i32 %5, -4
  %and11 = and i32 %add10, 255
  store i32 %and11, ptr %digit, align 4
  %6 = load i32, ptr %a, align 4
  %7 = load i32, ptr %upper, align 4
  %and12 = and i32 %6, %7
  store i32 %and12, ptr %result, align 4
  %8 = load i32, ptr %a, align 4
  %xor = xor i32 255, %8
  %9 = load i32, ptr %b, align 4
  %and13 = and i32 %xor, %9
  %10 = load i32, ptr %lower, align 4
  %and14 = and i32 %and13, %10
  %11 = load i32, ptr %result, align 4
  %or = or i32 %11, %and14
  store i32 %or, ptr %result, align 4
  %12 = load i32, ptr %b, align 4
  %xor15 = xor i32 255, %12
  %13 = load i32, ptr %c, align 4
  %and16 = and i32 %xor15, %13
  %14 = load i32, ptr %digit, align 4
  %and17 = and i32 %and16, %14
  %15 = load i32, ptr %result, align 4
  %or18 = or i32 %15, %and17
  store i32 %or18, ptr %result, align 4
  %16 = load i32, ptr %x.addr, align 4
  %xor19 = xor i32 %16, 62
  %sub20 = sub i32 0, %xor19
  %shr21 = lshr i32 %sub20, 8
  %and22 = and i32 %shr21, 255
  %xor23 = xor i32 255, %and22
  %and24 = and i32 %xor23, 43
  %17 = load i32, ptr %result, align 4
  %or25 = or i32 %17, %and24
  store i32 %or25, ptr %result, align 4
  %18 = load i32, ptr %x.addr, align 4
  %xor26 = xor i32 %18, 63
  %sub27 = sub i32 0, %xor26
  %shr28 = lshr i32 %sub27, 8
  %and29 = and i32 %shr28, 255
  %xor30 = xor i32 255, %and29
  %and31 = and i32 %xor30, 47
  %19 = load i32, ptr %result, align 4
  %or32 = or i32 %19, %and31
  store i32 %or32, ptr %result, align 4
  %20 = load i32, ptr %result, align 4
  ret i32 %20
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
