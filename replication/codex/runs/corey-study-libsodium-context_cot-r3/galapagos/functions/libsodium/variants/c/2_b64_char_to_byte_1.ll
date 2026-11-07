; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r3/functions/libsodium/variants/c/2_b64_char_to_byte_1.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r3/functions/libsodium/variants/c/2_b64_char_to_byte_1.c"
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
  %q = alloca i32, align 4
  %x = alloca i32, align 4
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
  %not = xor i32 %or, -1
  %and = and i32 %not, 255
  store i32 %and, ptr %a, align 4
  %3 = load i32, ptr %u, align 4
  %sub3 = sub i32 %3, 97
  %shr4 = lshr i32 %sub3, 8
  %4 = load i32, ptr %u, align 4
  %sub5 = sub i32 122, %4
  %shr6 = lshr i32 %sub5, 8
  %or7 = or i32 %shr4, %shr6
  %not8 = xor i32 %or7, -1
  %and9 = and i32 %not8, 255
  store i32 %and9, ptr %b, align 4
  %5 = load i32, ptr %u, align 4
  %sub10 = sub i32 %5, 48
  %shr11 = lshr i32 %sub10, 8
  %6 = load i32, ptr %u, align 4
  %sub12 = sub i32 57, %6
  %shr13 = lshr i32 %sub12, 8
  %or14 = or i32 %shr11, %shr13
  %not15 = xor i32 %or14, -1
  %and16 = and i32 %not15, 255
  store i32 %and16, ptr %d, align 4
  %7 = load i32, ptr %u, align 4
  %xor = xor i32 %7, 43
  %sub17 = sub i32 0, %xor
  %shr18 = lshr i32 %sub17, 8
  %not19 = xor i32 %shr18, -1
  %and20 = and i32 %not19, 255
  store i32 %and20, ptr %p, align 4
  %8 = load i32, ptr %u, align 4
  %xor21 = xor i32 %8, 47
  %sub22 = sub i32 0, %xor21
  %shr23 = lshr i32 %sub22, 8
  %not24 = xor i32 %shr23, -1
  %and25 = and i32 %not24, 255
  store i32 %and25, ptr %q, align 4
  %9 = load i32, ptr %a, align 4
  %10 = load i32, ptr %u, align 4
  %sub26 = sub i32 %10, 65
  %and27 = and i32 %9, %sub26
  %11 = load i32, ptr %b, align 4
  %12 = load i32, ptr %u, align 4
  %sub28 = sub i32 %12, 71
  %and29 = and i32 %11, %sub28
  %or30 = or i32 %and27, %and29
  %13 = load i32, ptr %d, align 4
  %14 = load i32, ptr %u, align 4
  %sub31 = sub i32 %14, -4
  %and32 = and i32 %13, %sub31
  %or33 = or i32 %or30, %and32
  %15 = load i32, ptr %p, align 4
  %and34 = and i32 %15, 62
  %or35 = or i32 %or33, %and34
  %16 = load i32, ptr %q, align 4
  %and36 = and i32 %16, 63
  %or37 = or i32 %or35, %and36
  store i32 %or37, ptr %x, align 4
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
