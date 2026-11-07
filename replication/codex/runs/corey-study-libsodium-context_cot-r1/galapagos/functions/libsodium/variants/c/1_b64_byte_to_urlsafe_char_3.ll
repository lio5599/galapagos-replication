; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r1/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_3.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r1/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_3.c"
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
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  %p = alloca i32, align 4
  %q = alloca i32, align 4
  %r = alloca i32, align 4
  %s = alloca i32, align 4
  %t = alloca i32, align 4
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
  %not = xor i32 %5, -1
  %6 = load i32, ptr %x.addr, align 4
  %add = add i32 %6, 65
  %not16 = xor i32 %add, -1
  %or = or i32 %not, %not16
  %not17 = xor i32 %or, -1
  store i32 %not17, ptr %p, align 4
  %7 = load i32, ptr %a, align 4
  %xor18 = xor i32 %7, 255
  %not19 = xor i32 %xor18, -1
  %8 = load i32, ptr %b, align 4
  %not20 = xor i32 %8, -1
  %or21 = or i32 %not19, %not20
  %9 = load i32, ptr %x.addr, align 4
  %add22 = add i32 %9, 71
  %not23 = xor i32 %add22, -1
  %or24 = or i32 %or21, %not23
  %not25 = xor i32 %or24, -1
  store i32 %not25, ptr %q, align 4
  %10 = load i32, ptr %b, align 4
  %xor26 = xor i32 %10, 255
  %not27 = xor i32 %xor26, -1
  %11 = load i32, ptr %c, align 4
  %not28 = xor i32 %11, -1
  %or29 = or i32 %not27, %not28
  %12 = load i32, ptr %x.addr, align 4
  %add30 = add i32 %12, -4
  %not31 = xor i32 %add30, -1
  %or32 = or i32 %or29, %not31
  %not33 = xor i32 %or32, -1
  store i32 %not33, ptr %r, align 4
  %13 = load i32, ptr %d, align 4
  %not34 = xor i32 %13, -1
  %or35 = or i32 %not34, -46
  %not36 = xor i32 %or35, -1
  store i32 %not36, ptr %s, align 4
  %14 = load i32, ptr %e, align 4
  %not37 = xor i32 %14, -1
  %or38 = or i32 %not37, -96
  %not39 = xor i32 %or38, -1
  store i32 %not39, ptr %t, align 4
  %15 = load i32, ptr %p, align 4
  %16 = load i32, ptr %q, align 4
  %or40 = or i32 %15, %16
  %17 = load i32, ptr %r, align 4
  %or41 = or i32 %or40, %17
  %18 = load i32, ptr %s, align 4
  %or42 = or i32 %or41, %18
  %19 = load i32, ptr %t, align 4
  %or43 = or i32 %or42, %19
  ret i32 %or43
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
