; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r2/functions/libsodium/variants/c/2_b64_char_to_byte_0.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r2/functions/libsodium/variants/c/2_b64_char_to_byte_0.c"
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
  %plus = alloca i32, align 4
  %slash = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %shr = lshr i32 %sub, 8
  %not = xor i32 %shr, -1
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %shr2 = lshr i32 %sub1, 8
  %not3 = xor i32 %shr2, -1
  %and = and i32 %not, %not3
  %3 = load i32, ptr %u, align 4
  %sub4 = sub i32 %3, 65
  %and5 = and i32 %and, %sub4
  %and6 = and i32 %and5, 255
  store i32 %and6, ptr %upper, align 4
  %4 = load i32, ptr %u, align 4
  %sub7 = sub i32 %4, 97
  %shr8 = lshr i32 %sub7, 8
  %not9 = xor i32 %shr8, -1
  %5 = load i32, ptr %u, align 4
  %sub10 = sub i32 122, %5
  %shr11 = lshr i32 %sub10, 8
  %not12 = xor i32 %shr11, -1
  %and13 = and i32 %not9, %not12
  %6 = load i32, ptr %u, align 4
  %sub14 = sub i32 %6, 71
  %and15 = and i32 %and13, %sub14
  %and16 = and i32 %and15, 255
  store i32 %and16, ptr %lower, align 4
  %7 = load i32, ptr %u, align 4
  %sub17 = sub i32 %7, 48
  %shr18 = lshr i32 %sub17, 8
  %not19 = xor i32 %shr18, -1
  %8 = load i32, ptr %u, align 4
  %sub20 = sub i32 57, %8
  %shr21 = lshr i32 %sub20, 8
  %not22 = xor i32 %shr21, -1
  %and23 = and i32 %not19, %not22
  %9 = load i32, ptr %u, align 4
  %sub24 = sub i32 %9, -4
  %and25 = and i32 %and23, %sub24
  %and26 = and i32 %and25, 255
  store i32 %and26, ptr %digit, align 4
  %10 = load i32, ptr %u, align 4
  %xor = xor i32 %10, 43
  %sub27 = sub i32 0, %xor
  %shr28 = lshr i32 %sub27, 8
  %not29 = xor i32 %shr28, -1
  %and30 = and i32 %not29, 62
  store i32 %and30, ptr %plus, align 4
  %11 = load i32, ptr %u, align 4
  %xor31 = xor i32 %11, 47
  %sub32 = sub i32 0, %xor31
  %shr33 = lshr i32 %sub32, 8
  %not34 = xor i32 %shr33, -1
  %and35 = and i32 %not34, 63
  store i32 %and35, ptr %slash, align 4
  %12 = load i32, ptr %upper, align 4
  %13 = load i32, ptr %lower, align 4
  %or = or i32 %12, %13
  %14 = load i32, ptr %digit, align 4
  %or36 = or i32 %or, %14
  %15 = load i32, ptr %plus, align 4
  %or37 = or i32 %or36, %15
  %16 = load i32, ptr %slash, align 4
  %or38 = or i32 %or37, %16
  store i32 %or38, ptr %x, align 4
  %17 = load i32, ptr %x, align 4
  %18 = load i32, ptr %x, align 4
  %sub39 = sub i32 0, %18
  %shr40 = lshr i32 %sub39, 8
  %not41 = xor i32 %shr40, -1
  %19 = load i32, ptr %u, align 4
  %xor42 = xor i32 %19, 65
  %sub43 = sub i32 0, %xor42
  %shr44 = lshr i32 %sub43, 8
  %and45 = and i32 %not41, %shr44
  %and46 = and i32 %and45, 255
  %or47 = or i32 %17, %and46
  ret i32 %or47
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
