; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r3/functions/libsodium/variants/c/0_b64_byte_to_char_7.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r3/functions/libsodium/variants/c/0_b64_byte_to_char_7.c"
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
  %result = alloca i32, align 4
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
  %3 = load i32, ptr %a, align 4
  %4 = load i32, ptr %x.addr, align 4
  %add = add i32 %4, 65
  %and7 = and i32 %3, %add
  store i32 %and7, ptr %result, align 4
  %5 = load i32, ptr %a, align 4
  %xor = xor i32 %5, 255
  %6 = load i32, ptr %b, align 4
  %and8 = and i32 %xor, %6
  %7 = load i32, ptr %x.addr, align 4
  %add9 = add i32 %7, 71
  %and10 = and i32 %and8, %add9
  store i32 %and10, ptr %t, align 4
  %8 = load i32, ptr %t, align 4
  %9 = load i32, ptr %result, align 4
  %not = xor i32 %9, -1
  %and11 = and i32 %8, %not
  %10 = load i32, ptr %result, align 4
  %xor12 = xor i32 %10, %and11
  store i32 %xor12, ptr %result, align 4
  %11 = load i32, ptr %b, align 4
  %xor13 = xor i32 %11, 255
  %12 = load i32, ptr %c, align 4
  %and14 = and i32 %xor13, %12
  %13 = load i32, ptr %x.addr, align 4
  %add15 = add i32 %13, -4
  %and16 = and i32 %and14, %add15
  store i32 %and16, ptr %t, align 4
  %14 = load i32, ptr %t, align 4
  %15 = load i32, ptr %result, align 4
  %not17 = xor i32 %15, -1
  %and18 = and i32 %14, %not17
  %16 = load i32, ptr %result, align 4
  %xor19 = xor i32 %16, %and18
  store i32 %xor19, ptr %result, align 4
  %17 = load i32, ptr %x.addr, align 4
  %xor20 = xor i32 %17, 62
  %sub21 = sub i32 0, %xor20
  %shr22 = lshr i32 %sub21, 8
  %and23 = and i32 %shr22, 255
  %xor24 = xor i32 %and23, 255
  %and25 = and i32 %xor24, 43
  store i32 %and25, ptr %t, align 4
  %18 = load i32, ptr %t, align 4
  %19 = load i32, ptr %result, align 4
  %not26 = xor i32 %19, -1
  %and27 = and i32 %18, %not26
  %20 = load i32, ptr %result, align 4
  %xor28 = xor i32 %20, %and27
  store i32 %xor28, ptr %result, align 4
  %21 = load i32, ptr %x.addr, align 4
  %xor29 = xor i32 %21, 63
  %sub30 = sub i32 0, %xor29
  %shr31 = lshr i32 %sub30, 8
  %and32 = and i32 %shr31, 255
  %xor33 = xor i32 %and32, 255
  %and34 = and i32 %xor33, 47
  store i32 %and34, ptr %t, align 4
  %22 = load i32, ptr %t, align 4
  %23 = load i32, ptr %result, align 4
  %not35 = xor i32 %23, -1
  %and36 = and i32 %22, %not35
  %24 = load i32, ptr %result, align 4
  %xor37 = xor i32 %24, %and36
  store i32 %xor37, ptr %result, align 4
  %25 = load i32, ptr %result, align 4
  ret i32 %25
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
