; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r3/functions/libsodium/variants/c/2_b64_char_to_byte_0.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r3/functions/libsodium/variants/c/2_b64_char_to_byte_0.c"
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
  %and = and i32 %shr, 255
  %xor = xor i32 %and, 255
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %shr2 = lshr i32 %sub1, 8
  %and3 = and i32 %shr2, 255
  %xor4 = xor i32 %and3, 255
  %and5 = and i32 %xor, %xor4
  store i32 %and5, ptr %upper, align 4
  %3 = load i32, ptr %u, align 4
  %sub6 = sub i32 %3, 97
  %shr7 = lshr i32 %sub6, 8
  %and8 = and i32 %shr7, 255
  %xor9 = xor i32 %and8, 255
  %4 = load i32, ptr %u, align 4
  %sub10 = sub i32 122, %4
  %shr11 = lshr i32 %sub10, 8
  %and12 = and i32 %shr11, 255
  %xor13 = xor i32 %and12, 255
  %and14 = and i32 %xor9, %xor13
  store i32 %and14, ptr %lower, align 4
  %5 = load i32, ptr %u, align 4
  %sub15 = sub i32 %5, 48
  %shr16 = lshr i32 %sub15, 8
  %and17 = and i32 %shr16, 255
  %xor18 = xor i32 %and17, 255
  %6 = load i32, ptr %u, align 4
  %sub19 = sub i32 57, %6
  %shr20 = lshr i32 %sub19, 8
  %and21 = and i32 %shr20, 255
  %xor22 = xor i32 %and21, 255
  %and23 = and i32 %xor18, %xor22
  store i32 %and23, ptr %digit, align 4
  %7 = load i32, ptr %u, align 4
  %xor24 = xor i32 %7, 43
  %sub25 = sub i32 0, %xor24
  %shr26 = lshr i32 %sub25, 8
  %and27 = and i32 %shr26, 255
  %xor28 = xor i32 %and27, 255
  store i32 %xor28, ptr %plus, align 4
  %8 = load i32, ptr %u, align 4
  %xor29 = xor i32 %8, 47
  %sub30 = sub i32 0, %xor29
  %shr31 = lshr i32 %sub30, 8
  %and32 = and i32 %shr31, 255
  %xor33 = xor i32 %and32, 255
  store i32 %xor33, ptr %slash, align 4
  %9 = load i32, ptr %upper, align 4
  %10 = load i32, ptr %u, align 4
  %sub34 = sub i32 %10, 65
  %and35 = and i32 %9, %sub34
  %11 = load i32, ptr %lower, align 4
  %12 = load i32, ptr %u, align 4
  %sub36 = sub i32 %12, 71
  %and37 = and i32 %11, %sub36
  %or = or i32 %and35, %and37
  %13 = load i32, ptr %digit, align 4
  %14 = load i32, ptr %u, align 4
  %sub38 = sub i32 %14, -4
  %and39 = and i32 %13, %sub38
  %or40 = or i32 %or, %and39
  %15 = load i32, ptr %plus, align 4
  %and41 = and i32 %15, 62
  %or42 = or i32 %or40, %and41
  %16 = load i32, ptr %slash, align 4
  %and43 = and i32 %16, 63
  %or44 = or i32 %or42, %and43
  store i32 %or44, ptr %x, align 4
  %17 = load i32, ptr %x, align 4
  %18 = load i32, ptr %x, align 4
  %sub45 = sub i32 0, %18
  %shr46 = lshr i32 %sub45, 8
  %and47 = and i32 %shr46, 255
  %xor48 = xor i32 %and47, 255
  %19 = load i32, ptr %u, align 4
  %xor49 = xor i32 %19, 65
  %sub50 = sub i32 0, %xor49
  %shr51 = lshr i32 %sub50, 8
  %and52 = and i32 %shr51, 255
  %and53 = and i32 %xor48, %and52
  %or54 = or i32 %17, %and53
  ret i32 %or54
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
