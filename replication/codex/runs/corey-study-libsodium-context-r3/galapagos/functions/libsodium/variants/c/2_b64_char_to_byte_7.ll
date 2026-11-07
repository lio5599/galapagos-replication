; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r3/functions/libsodium/variants/c/2_b64_char_to_byte_7.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r3/functions/libsodium/variants/c/2_b64_char_to_byte_7.c"
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
  %symbols = alloca i32, align 4
  %x = alloca i32, align 4
  %invalid = alloca i32, align 4
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
  %3 = load i32, ptr %u, align 4
  %sub2 = sub i32 %3, 65
  %and = and i32 %not, %sub2
  store i32 %and, ptr %upper, align 4
  %4 = load i32, ptr %u, align 4
  %sub3 = sub i32 %4, 97
  %5 = load i32, ptr %u, align 4
  %sub4 = sub i32 122, %5
  %or5 = or i32 %sub3, %sub4
  %shr6 = lshr i32 %or5, 8
  %not7 = xor i32 %shr6, -1
  %6 = load i32, ptr %u, align 4
  %sub8 = sub i32 %6, 71
  %and9 = and i32 %not7, %sub8
  store i32 %and9, ptr %lower, align 4
  %7 = load i32, ptr %u, align 4
  %sub10 = sub i32 %7, 48
  %8 = load i32, ptr %u, align 4
  %sub11 = sub i32 57, %8
  %or12 = or i32 %sub10, %sub11
  %shr13 = lshr i32 %or12, 8
  %not14 = xor i32 %shr13, -1
  %9 = load i32, ptr %u, align 4
  %sub15 = sub i32 %9, -4
  %and16 = and i32 %not14, %sub15
  store i32 %and16, ptr %digit, align 4
  %10 = load i32, ptr %u, align 4
  %xor = xor i32 %10, 43
  %sub17 = sub i32 0, %xor
  %shr18 = lshr i32 %sub17, 8
  %not19 = xor i32 %shr18, -1
  %and20 = and i32 %not19, 62
  %11 = load i32, ptr %u, align 4
  %xor21 = xor i32 %11, 47
  %sub22 = sub i32 0, %xor21
  %shr23 = lshr i32 %sub22, 8
  %not24 = xor i32 %shr23, -1
  %and25 = and i32 %not24, 63
  %or26 = or i32 %and20, %and25
  store i32 %or26, ptr %symbols, align 4
  %12 = load i32, ptr %upper, align 4
  %13 = load i32, ptr %lower, align 4
  %or27 = or i32 %12, %13
  %14 = load i32, ptr %digit, align 4
  %or28 = or i32 %or27, %14
  %15 = load i32, ptr %symbols, align 4
  %or29 = or i32 %or28, %15
  %and30 = and i32 %or29, 255
  store i32 %and30, ptr %x, align 4
  %16 = load i32, ptr %u, align 4
  %xor31 = xor i32 %16, 65
  %sub32 = sub i32 0, %xor31
  %shr33 = lshr i32 %sub32, 8
  %and34 = and i32 %shr33, 255
  store i32 %and34, ptr %invalid, align 4
  %17 = load i32, ptr %x, align 4
  %18 = load i32, ptr %x, align 4
  %cmp = icmp eq i32 %18, 0
  %conv = zext i1 %cmp to i32
  %19 = load i32, ptr %invalid, align 4
  %mul = mul i32 %conv, %19
  %add = add i32 %17, %mul
  ret i32 %add
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
