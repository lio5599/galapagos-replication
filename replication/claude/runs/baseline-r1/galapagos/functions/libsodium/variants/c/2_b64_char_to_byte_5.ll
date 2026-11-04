; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_5.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_5.c"
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
  %notA = alloca i32, align 4
  %sl = alloca i32, align 4
  %pl = alloca i32, align 4
  %di = alloca i32, align 4
  %lo = alloca i32, align 4
  %up = alloca i32, align 4
  %x = alloca i32, align 4
  %isz = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %xor = xor i32 %1, 65
  %sub = sub i32 0, %xor
  %shr = lshr i32 %sub, 8
  %and = and i32 %shr, 255
  store i32 %and, ptr %notA, align 4
  %2 = load i32, ptr %u, align 4
  %xor1 = xor i32 %2, 47
  %sub2 = sub i32 0, %xor1
  %shr3 = lshr i32 %sub2, 8
  %and4 = and i32 %shr3, 255
  %xor5 = xor i32 %and4, 255
  %and6 = and i32 %xor5, 63
  store i32 %and6, ptr %sl, align 4
  %3 = load i32, ptr %u, align 4
  %xor7 = xor i32 %3, 43
  %sub8 = sub i32 0, %xor7
  %shr9 = lshr i32 %sub8, 8
  %and10 = and i32 %shr9, 255
  %xor11 = xor i32 %and10, 255
  %and12 = and i32 %xor11, 62
  store i32 %and12, ptr %pl, align 4
  %4 = load i32, ptr %u, align 4
  %sub13 = sub i32 %4, 48
  %shr14 = lshr i32 %sub13, 8
  %and15 = and i32 %shr14, 255
  %xor16 = xor i32 %and15, 255
  %5 = load i32, ptr %u, align 4
  %sub17 = sub i32 57, %5
  %shr18 = lshr i32 %sub17, 8
  %and19 = and i32 %shr18, 255
  %xor20 = xor i32 %and19, 255
  %and21 = and i32 %xor16, %xor20
  %6 = load i32, ptr %u, align 4
  %sub22 = sub i32 %6, -4
  %and23 = and i32 %and21, %sub22
  store i32 %and23, ptr %di, align 4
  %7 = load i32, ptr %u, align 4
  %sub24 = sub i32 %7, 97
  %shr25 = lshr i32 %sub24, 8
  %and26 = and i32 %shr25, 255
  %xor27 = xor i32 %and26, 255
  %8 = load i32, ptr %u, align 4
  %sub28 = sub i32 122, %8
  %shr29 = lshr i32 %sub28, 8
  %and30 = and i32 %shr29, 255
  %xor31 = xor i32 %and30, 255
  %and32 = and i32 %xor27, %xor31
  %9 = load i32, ptr %u, align 4
  %sub33 = sub i32 %9, 71
  %and34 = and i32 %and32, %sub33
  store i32 %and34, ptr %lo, align 4
  %10 = load i32, ptr %u, align 4
  %sub35 = sub i32 %10, 65
  %shr36 = lshr i32 %sub35, 8
  %and37 = and i32 %shr36, 255
  %xor38 = xor i32 %and37, 255
  %11 = load i32, ptr %u, align 4
  %sub39 = sub i32 90, %11
  %shr40 = lshr i32 %sub39, 8
  %and41 = and i32 %shr40, 255
  %xor42 = xor i32 %and41, 255
  %and43 = and i32 %xor38, %xor42
  %12 = load i32, ptr %u, align 4
  %sub44 = sub i32 %12, 65
  %and45 = and i32 %and43, %sub44
  store i32 %and45, ptr %up, align 4
  %13 = load i32, ptr %sl, align 4
  %14 = load i32, ptr %pl, align 4
  %or = or i32 %13, %14
  %15 = load i32, ptr %di, align 4
  %or46 = or i32 %or, %15
  %16 = load i32, ptr %lo, align 4
  %or47 = or i32 %or46, %16
  %17 = load i32, ptr %up, align 4
  %or48 = or i32 %or47, %17
  store i32 %or48, ptr %x, align 4
  %18 = load i32, ptr %x, align 4
  %sub49 = sub i32 0, %18
  %shr50 = lshr i32 %sub49, 8
  %and51 = and i32 %shr50, 255
  %xor52 = xor i32 %and51, 255
  store i32 %xor52, ptr %isz, align 4
  %19 = load i32, ptr %x, align 4
  %20 = load i32, ptr %isz, align 4
  %21 = load i32, ptr %notA, align 4
  %and53 = and i32 %20, %21
  %or54 = or i32 %19, %and53
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
