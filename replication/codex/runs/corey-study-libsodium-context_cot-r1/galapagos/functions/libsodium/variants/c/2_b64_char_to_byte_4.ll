; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r1/functions/libsodium/variants/c/2_b64_char_to_byte_4.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r1/functions/libsodium/variants/c/2_b64_char_to_byte_4.c"
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
  %m = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %or = or i32 %sub, %sub1
  %shr = lshr i32 %or, 8
  %not = xor i32 %shr, -1
  %and = and i32 %not, 255
  store i32 %and, ptr %m, align 4
  %3 = load i32, ptr %m, align 4
  %4 = load i32, ptr %u, align 4
  %sub2 = sub i32 %4, 65
  %and3 = and i32 %3, %sub2
  store i32 %and3, ptr %x, align 4
  %5 = load i32, ptr %u, align 4
  %sub4 = sub i32 %5, 97
  %6 = load i32, ptr %u, align 4
  %sub5 = sub i32 122, %6
  %or6 = or i32 %sub4, %sub5
  %shr7 = lshr i32 %or6, 8
  %not8 = xor i32 %shr7, -1
  %and9 = and i32 %not8, 255
  store i32 %and9, ptr %m, align 4
  %7 = load i32, ptr %m, align 4
  %8 = load i32, ptr %u, align 4
  %sub10 = sub i32 %8, 97
  %add = add i32 %sub10, 26
  %and11 = and i32 %7, %add
  %9 = load i32, ptr %x, align 4
  %or12 = or i32 %9, %and11
  store i32 %or12, ptr %x, align 4
  %10 = load i32, ptr %u, align 4
  %sub13 = sub i32 %10, 48
  %11 = load i32, ptr %u, align 4
  %sub14 = sub i32 57, %11
  %or15 = or i32 %sub13, %sub14
  %shr16 = lshr i32 %or15, 8
  %not17 = xor i32 %shr16, -1
  %and18 = and i32 %not17, 255
  store i32 %and18, ptr %m, align 4
  %12 = load i32, ptr %m, align 4
  %13 = load i32, ptr %u, align 4
  %sub19 = sub i32 %13, 48
  %add20 = add i32 %sub19, 52
  %and21 = and i32 %12, %add20
  %14 = load i32, ptr %x, align 4
  %or22 = or i32 %14, %and21
  store i32 %or22, ptr %x, align 4
  %15 = load i32, ptr %u, align 4
  %xor = xor i32 %15, 43
  %sub23 = sub i32 0, %xor
  %shr24 = lshr i32 %sub23, 8
  %not25 = xor i32 %shr24, -1
  %and26 = and i32 %not25, 255
  store i32 %and26, ptr %m, align 4
  %16 = load i32, ptr %m, align 4
  %and27 = and i32 %16, 62
  %17 = load i32, ptr %x, align 4
  %or28 = or i32 %17, %and27
  store i32 %or28, ptr %x, align 4
  %18 = load i32, ptr %u, align 4
  %xor29 = xor i32 %18, 47
  %sub30 = sub i32 0, %xor29
  %shr31 = lshr i32 %sub30, 8
  %not32 = xor i32 %shr31, -1
  %and33 = and i32 %not32, 255
  store i32 %and33, ptr %m, align 4
  %19 = load i32, ptr %m, align 4
  %and34 = and i32 %19, 63
  %20 = load i32, ptr %x, align 4
  %or35 = or i32 %20, %and34
  store i32 %or35, ptr %x, align 4
  %21 = load i32, ptr %x, align 4
  %sub36 = sub i32 0, %21
  %shr37 = lshr i32 %sub36, 8
  %not38 = xor i32 %shr37, -1
  %and39 = and i32 %not38, 255
  store i32 %and39, ptr %m, align 4
  %22 = load i32, ptr %x, align 4
  %23 = load i32, ptr %m, align 4
  %24 = load i32, ptr %u, align 4
  %xor40 = xor i32 %24, 65
  %sub41 = sub i32 0, %xor40
  %shr42 = lshr i32 %sub41, 8
  %and43 = and i32 %shr42, 255
  %and44 = and i32 %23, %and43
  %or45 = or i32 %22, %and44
  ret i32 %or45
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
