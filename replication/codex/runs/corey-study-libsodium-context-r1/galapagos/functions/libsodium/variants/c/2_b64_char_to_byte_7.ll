; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r1/functions/libsodium/variants/c/2_b64_char_to_byte_7.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r1/functions/libsodium/variants/c/2_b64_char_to_byte_7.c"
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
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %d = alloca i32, align 4
  %p = alloca i32, align 4
  %s = alloca i32, align 4
  %x = alloca i32, align 4
  %z = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %shr = lshr i32 %sub, 8
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %shr2 = lshr i32 %sub1, 8
  %or = or i32 %shr, %shr2
  %and = and i32 %or, 255
  store i32 %and, ptr %a, align 4
  %3 = load i32, ptr %u, align 4
  %sub3 = sub i32 %3, 97
  %shr4 = lshr i32 %sub3, 8
  %4 = load i32, ptr %u, align 4
  %sub5 = sub i32 122, %4
  %shr6 = lshr i32 %sub5, 8
  %or7 = or i32 %shr4, %shr6
  %and8 = and i32 %or7, 255
  store i32 %and8, ptr %b, align 4
  %5 = load i32, ptr %u, align 4
  %sub9 = sub i32 %5, 48
  %shr10 = lshr i32 %sub9, 8
  %6 = load i32, ptr %u, align 4
  %sub11 = sub i32 57, %6
  %shr12 = lshr i32 %sub11, 8
  %or13 = or i32 %shr10, %shr12
  %and14 = and i32 %or13, 255
  store i32 %and14, ptr %d, align 4
  %7 = load i32, ptr %u, align 4
  %xor = xor i32 %7, 43
  %sub15 = sub i32 0, %xor
  %shr16 = lshr i32 %sub15, 8
  %and17 = and i32 %shr16, 255
  store i32 %and17, ptr %p, align 4
  %8 = load i32, ptr %u, align 4
  %xor18 = xor i32 %8, 47
  %sub19 = sub i32 0, %xor18
  %shr20 = lshr i32 %sub19, 8
  %and21 = and i32 %shr20, 255
  store i32 %and21, ptr %s, align 4
  %9 = load i32, ptr %u, align 4
  %sub22 = sub i32 %9, 65
  %10 = load i32, ptr %a, align 4
  %not = xor i32 %10, -1
  %and23 = and i32 %sub22, %not
  %11 = load i32, ptr %u, align 4
  %sub24 = sub i32 %11, 71
  %12 = load i32, ptr %b, align 4
  %not25 = xor i32 %12, -1
  %and26 = and i32 %sub24, %not25
  %or27 = or i32 %and23, %and26
  %13 = load i32, ptr %u, align 4
  %sub28 = sub i32 %13, -4
  %14 = load i32, ptr %d, align 4
  %not29 = xor i32 %14, -1
  %and30 = and i32 %sub28, %not29
  %or31 = or i32 %or27, %and30
  %15 = load i32, ptr %p, align 4
  %not32 = xor i32 %15, -1
  %and33 = and i32 62, %not32
  %or34 = or i32 %or31, %and33
  %16 = load i32, ptr %s, align 4
  %not35 = xor i32 %16, -1
  %and36 = and i32 63, %not35
  %or37 = or i32 %or34, %and36
  %and38 = and i32 %or37, 255
  store i32 %and38, ptr %x, align 4
  %17 = load i32, ptr %x, align 4
  %sub39 = sub i32 0, %17
  %shr40 = lshr i32 %sub39, 8
  %and41 = and i32 %shr40, 255
  store i32 %and41, ptr %z, align 4
  %18 = load i32, ptr %u, align 4
  %xor42 = xor i32 %18, 65
  %sub43 = sub i32 0, %xor42
  %shr44 = lshr i32 %sub43, 8
  %and45 = and i32 %shr44, 255
  store i32 %and45, ptr %n, align 4
  %19 = load i32, ptr %x, align 4
  %20 = load i32, ptr %n, align 4
  %21 = load i32, ptr %z, align 4
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
