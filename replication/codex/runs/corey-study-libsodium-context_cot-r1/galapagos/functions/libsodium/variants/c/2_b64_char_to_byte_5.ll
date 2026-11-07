; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r1/functions/libsodium/variants/c/2_b64_char_to_byte_5.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r1/functions/libsodium/variants/c/2_b64_char_to_byte_5.c"
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
  store i32 %and5, ptr %a, align 4
  %4 = load i32, ptr %u, align 4
  %sub6 = sub i32 %4, 97
  %shr7 = lshr i32 %sub6, 8
  %not8 = xor i32 %shr7, -1
  %5 = load i32, ptr %u, align 4
  %sub9 = sub i32 122, %5
  %shr10 = lshr i32 %sub9, 8
  %not11 = xor i32 %shr10, -1
  %and12 = and i32 %not8, %not11
  %6 = load i32, ptr %u, align 4
  %sub13 = sub i32 %6, 97
  %add = add i32 %sub13, 26
  %and14 = and i32 %and12, %add
  store i32 %and14, ptr %b, align 4
  %7 = load i32, ptr %u, align 4
  %sub15 = sub i32 %7, 48
  %shr16 = lshr i32 %sub15, 8
  %not17 = xor i32 %shr16, -1
  %8 = load i32, ptr %u, align 4
  %sub18 = sub i32 57, %8
  %shr19 = lshr i32 %sub18, 8
  %not20 = xor i32 %shr19, -1
  %and21 = and i32 %not17, %not20
  %9 = load i32, ptr %u, align 4
  %sub22 = sub i32 %9, 48
  %add23 = add i32 %sub22, 52
  %and24 = and i32 %and21, %add23
  store i32 %and24, ptr %d, align 4
  %10 = load i32, ptr %u, align 4
  %xor = xor i32 %10, 43
  %sub25 = sub i32 0, %xor
  %shr26 = lshr i32 %sub25, 8
  %not27 = xor i32 %shr26, -1
  %and28 = and i32 %not27, 62
  store i32 %and28, ptr %p, align 4
  %11 = load i32, ptr %u, align 4
  %xor29 = xor i32 %11, 47
  %sub30 = sub i32 0, %xor29
  %shr31 = lshr i32 %sub30, 8
  %not32 = xor i32 %shr31, -1
  %and33 = and i32 %not32, 63
  store i32 %and33, ptr %s, align 4
  %12 = load i32, ptr %a, align 4
  %13 = load i32, ptr %b, align 4
  %or = or i32 %12, %13
  %14 = load i32, ptr %d, align 4
  %or34 = or i32 %or, %14
  %15 = load i32, ptr %p, align 4
  %or35 = or i32 %or34, %15
  %16 = load i32, ptr %s, align 4
  %or36 = or i32 %or35, %16
  %and37 = and i32 %or36, 255
  store i32 %and37, ptr %x, align 4
  %17 = load i32, ptr %x, align 4
  %18 = load i32, ptr %x, align 4
  %sub38 = sub i32 0, %18
  %shr39 = lshr i32 %sub38, 8
  %not40 = xor i32 %shr39, -1
  %19 = load i32, ptr %u, align 4
  %xor41 = xor i32 %19, 65
  %sub42 = sub i32 0, %xor41
  %shr43 = lshr i32 %sub42, 8
  %and44 = and i32 %not40, %shr43
  %and45 = and i32 %and44, 255
  %or46 = or i32 %17, %and45
  ret i32 %or46
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
