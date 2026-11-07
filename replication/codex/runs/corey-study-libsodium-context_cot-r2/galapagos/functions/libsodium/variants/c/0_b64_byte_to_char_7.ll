; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r2/functions/libsodium/variants/c/0_b64_byte_to_char_7.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r2/functions/libsodium/variants/c/0_b64_byte_to_char_7.c"
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
  %p = alloca i32, align 4
  %q = alloca i32, align 4
  %r = alloca i32, align 4
  %low = alloca i32, align 4
  %high = alloca i32, align 4
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
  %5 = load i32, ptr %x.addr, align 4
  %add = add i32 %5, 65
  store i32 %add, ptr %p, align 4
  %6 = load i32, ptr %x.addr, align 4
  %add16 = add i32 %6, 71
  store i32 %add16, ptr %q, align 4
  %7 = load i32, ptr %x.addr, align 4
  %add17 = add i32 %7, -4
  store i32 %add17, ptr %r, align 4
  %8 = load i32, ptr %a, align 4
  %and18 = and i32 %8, 15
  %9 = load i32, ptr %p, align 4
  %and19 = and i32 %and18, %9
  %10 = load i32, ptr %a, align 4
  %xor20 = xor i32 %10, 255
  %11 = load i32, ptr %b, align 4
  %and21 = and i32 %xor20, %11
  %and22 = and i32 %and21, 15
  %12 = load i32, ptr %q, align 4
  %and23 = and i32 %and22, %12
  %or = or i32 %and19, %and23
  %13 = load i32, ptr %b, align 4
  %xor24 = xor i32 %13, 255
  %14 = load i32, ptr %c, align 4
  %and25 = and i32 %xor24, %14
  %and26 = and i32 %and25, 15
  %15 = load i32, ptr %r, align 4
  %and27 = and i32 %and26, %15
  %or28 = or i32 %or, %and27
  %16 = load i32, ptr %d, align 4
  %and29 = and i32 %16, 15
  %and30 = and i32 %and29, 43
  %or31 = or i32 %or28, %and30
  %17 = load i32, ptr %e, align 4
  %and32 = and i32 %17, 15
  %and33 = and i32 %and32, 47
  %or34 = or i32 %or31, %and33
  store i32 %or34, ptr %low, align 4
  %18 = load i32, ptr %a, align 4
  %and35 = and i32 %18, 240
  %19 = load i32, ptr %p, align 4
  %and36 = and i32 %and35, %19
  %20 = load i32, ptr %a, align 4
  %xor37 = xor i32 %20, 255
  %21 = load i32, ptr %b, align 4
  %and38 = and i32 %xor37, %21
  %and39 = and i32 %and38, 240
  %22 = load i32, ptr %q, align 4
  %and40 = and i32 %and39, %22
  %or41 = or i32 %and36, %and40
  %23 = load i32, ptr %b, align 4
  %xor42 = xor i32 %23, 255
  %24 = load i32, ptr %c, align 4
  %and43 = and i32 %xor42, %24
  %and44 = and i32 %and43, 240
  %25 = load i32, ptr %r, align 4
  %and45 = and i32 %and44, %25
  %or46 = or i32 %or41, %and45
  %26 = load i32, ptr %d, align 4
  %and47 = and i32 %26, 240
  %and48 = and i32 %and47, 43
  %or49 = or i32 %or46, %and48
  %27 = load i32, ptr %e, align 4
  %and50 = and i32 %27, 240
  %and51 = and i32 %and50, 47
  %or52 = or i32 %or49, %and51
  store i32 %or52, ptr %high, align 4
  %28 = load i32, ptr %low, align 4
  %29 = load i32, ptr %high, align 4
  %or53 = or i32 %28, %29
  ret i32 %or53
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
