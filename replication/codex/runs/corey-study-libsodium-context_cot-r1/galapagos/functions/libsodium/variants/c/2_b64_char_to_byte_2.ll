; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r1/functions/libsodium/variants/c/2_b64_char_to_byte_2.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r1/functions/libsodium/variants/c/2_b64_char_to_byte_2.c"
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
  %ra = alloca i32, align 4
  %rb = alloca i32, align 4
  %rd = alloca i32, align 4
  %rp = alloca i32, align 4
  %rs = alloca i32, align 4
  %x = alloca i32, align 4
  %rz = alloca i32, align 4
  %rn = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %or = or i32 %sub, %sub1
  %shr = lshr i32 %or, 8
  %and = and i32 %shr, 255
  store i32 %and, ptr %ra, align 4
  %3 = load i32, ptr %u, align 4
  %sub2 = sub i32 %3, 97
  %4 = load i32, ptr %u, align 4
  %sub3 = sub i32 122, %4
  %or4 = or i32 %sub2, %sub3
  %shr5 = lshr i32 %or4, 8
  %and6 = and i32 %shr5, 255
  store i32 %and6, ptr %rb, align 4
  %5 = load i32, ptr %u, align 4
  %sub7 = sub i32 %5, 48
  %6 = load i32, ptr %u, align 4
  %sub8 = sub i32 57, %6
  %or9 = or i32 %sub7, %sub8
  %shr10 = lshr i32 %or9, 8
  %and11 = and i32 %shr10, 255
  store i32 %and11, ptr %rd, align 4
  %7 = load i32, ptr %u, align 4
  %xor = xor i32 %7, 43
  %sub12 = sub i32 0, %xor
  %shr13 = lshr i32 %sub12, 8
  %and14 = and i32 %shr13, 255
  store i32 %and14, ptr %rp, align 4
  %8 = load i32, ptr %u, align 4
  %xor15 = xor i32 %8, 47
  %sub16 = sub i32 0, %xor15
  %shr17 = lshr i32 %sub16, 8
  %and18 = and i32 %shr17, 255
  store i32 %and18, ptr %rs, align 4
  %9 = load i32, ptr %u, align 4
  %sub19 = sub i32 %9, 65
  %and20 = and i32 %sub19, 255
  %10 = load i32, ptr %ra, align 4
  %not = xor i32 %10, -1
  %and21 = and i32 %and20, %not
  %11 = load i32, ptr %u, align 4
  %sub22 = sub i32 %11, 97
  %add = add i32 %sub22, 26
  %and23 = and i32 %add, 255
  %12 = load i32, ptr %rb, align 4
  %not24 = xor i32 %12, -1
  %and25 = and i32 %and23, %not24
  %or26 = or i32 %and21, %and25
  %13 = load i32, ptr %u, align 4
  %sub27 = sub i32 %13, 48
  %add28 = add i32 %sub27, 52
  %and29 = and i32 %add28, 255
  %14 = load i32, ptr %rd, align 4
  %not30 = xor i32 %14, -1
  %and31 = and i32 %and29, %not30
  %or32 = or i32 %or26, %and31
  %15 = load i32, ptr %rp, align 4
  %not33 = xor i32 %15, -1
  %and34 = and i32 62, %not33
  %or35 = or i32 %or32, %and34
  %16 = load i32, ptr %rs, align 4
  %not36 = xor i32 %16, -1
  %and37 = and i32 63, %not36
  %or38 = or i32 %or35, %and37
  store i32 %or38, ptr %x, align 4
  %17 = load i32, ptr %x, align 4
  %sub39 = sub i32 0, %17
  %shr40 = lshr i32 %sub39, 8
  %and41 = and i32 %shr40, 255
  store i32 %and41, ptr %rz, align 4
  %18 = load i32, ptr %u, align 4
  %xor42 = xor i32 %18, 65
  %sub43 = sub i32 0, %xor42
  %shr44 = lshr i32 %sub43, 8
  %and45 = and i32 %shr44, 255
  store i32 %and45, ptr %rn, align 4
  %19 = load i32, ptr %x, align 4
  %20 = load i32, ptr %rn, align 4
  %21 = load i32, ptr %rz, align 4
  %not46 = xor i32 %21, -1
  %and47 = and i32 %20, %not46
  %or48 = or i32 %19, %and47
  ret i32 %or48
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
