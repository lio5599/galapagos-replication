; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r3/functions/libsodium/variants/c/0_b64_byte_to_char_2.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r3/functions/libsodium/variants/c/0_b64_byte_to_char_2.c"
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
  %p = alloca i32, align 4
  %q = alloca i32, align 4
  %r = alloca i32, align 4
  %s = alloca i32, align 4
  %t = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %not = xor i32 %sub, -1
  %shr = lshr i32 %not, 8
  store i32 %shr, ptr %p, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  %not2 = xor i32 %sub1, -1
  %shr3 = lshr i32 %not2, 8
  store i32 %shr3, ptr %q, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub4 = sub i32 %2, 62
  %not5 = xor i32 %sub4, -1
  %shr6 = lshr i32 %not5, 8
  store i32 %shr6, ptr %r, align 4
  %3 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %3, 62
  %sub7 = sub i32 0, %xor
  %shr8 = lshr i32 %sub7, 8
  store i32 %shr8, ptr %s, align 4
  %4 = load i32, ptr %x.addr, align 4
  %xor9 = xor i32 %4, 63
  %sub10 = sub i32 0, %xor9
  %shr11 = lshr i32 %sub10, 8
  store i32 %shr11, ptr %t, align 4
  %5 = load i32, ptr %p, align 4
  %not12 = xor i32 %5, -1
  %6 = load i32, ptr %x.addr, align 4
  %add = add i32 %6, 65
  %and = and i32 %not12, %add
  %7 = load i32, ptr %p, align 4
  %8 = load i32, ptr %q, align 4
  %not13 = xor i32 %8, -1
  %and14 = and i32 %7, %not13
  %9 = load i32, ptr %x.addr, align 4
  %add15 = add i32 %9, 71
  %and16 = and i32 %and14, %add15
  %or = or i32 %and, %and16
  %10 = load i32, ptr %q, align 4
  %11 = load i32, ptr %r, align 4
  %not17 = xor i32 %11, -1
  %and18 = and i32 %10, %not17
  %12 = load i32, ptr %x.addr, align 4
  %add19 = add i32 %12, -4
  %and20 = and i32 %and18, %add19
  %or21 = or i32 %or, %and20
  %13 = load i32, ptr %s, align 4
  %not22 = xor i32 %13, -1
  %and23 = and i32 %not22, 43
  %or24 = or i32 %or21, %and23
  %14 = load i32, ptr %t, align 4
  %not25 = xor i32 %14, -1
  %and26 = and i32 %not25, 47
  %or27 = or i32 %or24, %and26
  store i32 %or27, ptr %result, align 4
  %15 = load i32, ptr %result, align 4
  %and28 = and i32 %15, 255
  ret i32 %and28
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
