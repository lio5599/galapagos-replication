; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r1/functions/libsodium/variants/c/2_b64_char_to_byte_0.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r1/functions/libsodium/variants/c/2_b64_char_to_byte_0.c"
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
  %and = and i32 %not, 255
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %shr2 = lshr i32 %sub1, 8
  %not3 = xor i32 %shr2, -1
  %and4 = and i32 %not3, 255
  %and5 = and i32 %and, %and4
  store i32 %and5, ptr %a, align 4
  %3 = load i32, ptr %u, align 4
  %sub6 = sub i32 %3, 97
  %shr7 = lshr i32 %sub6, 8
  %not8 = xor i32 %shr7, -1
  %and9 = and i32 %not8, 255
  %4 = load i32, ptr %u, align 4
  %sub10 = sub i32 122, %4
  %shr11 = lshr i32 %sub10, 8
  %not12 = xor i32 %shr11, -1
  %and13 = and i32 %not12, 255
  %and14 = and i32 %and9, %and13
  store i32 %and14, ptr %b, align 4
  %5 = load i32, ptr %u, align 4
  %sub15 = sub i32 %5, 48
  %shr16 = lshr i32 %sub15, 8
  %not17 = xor i32 %shr16, -1
  %and18 = and i32 %not17, 255
  %6 = load i32, ptr %u, align 4
  %sub19 = sub i32 57, %6
  %shr20 = lshr i32 %sub19, 8
  %not21 = xor i32 %shr20, -1
  %and22 = and i32 %not21, 255
  %and23 = and i32 %and18, %and22
  store i32 %and23, ptr %d, align 4
  %7 = load i32, ptr %u, align 4
  %xor = xor i32 %7, 43
  %sub24 = sub i32 0, %xor
  %shr25 = lshr i32 %sub24, 8
  %not26 = xor i32 %shr25, -1
  %and27 = and i32 %not26, 255
  store i32 %and27, ptr %p, align 4
  %8 = load i32, ptr %u, align 4
  %xor28 = xor i32 %8, 47
  %sub29 = sub i32 0, %xor28
  %shr30 = lshr i32 %sub29, 8
  %not31 = xor i32 %shr30, -1
  %and32 = and i32 %not31, 255
  store i32 %and32, ptr %s, align 4
  %9 = load i32, ptr %a, align 4
  %10 = load i32, ptr %u, align 4
  %sub33 = sub i32 %10, 65
  %and34 = and i32 %9, %sub33
  %11 = load i32, ptr %b, align 4
  %12 = load i32, ptr %u, align 4
  %sub35 = sub i32 %12, 71
  %and36 = and i32 %11, %sub35
  %or = or i32 %and34, %and36
  %13 = load i32, ptr %d, align 4
  %14 = load i32, ptr %u, align 4
  %sub37 = sub i32 %14, -4
  %and38 = and i32 %13, %sub37
  %or39 = or i32 %or, %and38
  %15 = load i32, ptr %p, align 4
  %and40 = and i32 %15, 62
  %or41 = or i32 %or39, %and40
  %16 = load i32, ptr %s, align 4
  %and42 = and i32 %16, 63
  %or43 = or i32 %or41, %and42
  store i32 %or43, ptr %x, align 4
  %17 = load i32, ptr %x, align 4
  %18 = load i32, ptr %x, align 4
  %sub44 = sub i32 0, %18
  %shr45 = lshr i32 %sub44, 8
  %not46 = xor i32 %shr45, -1
  %and47 = and i32 %not46, 255
  %19 = load i32, ptr %u, align 4
  %xor48 = xor i32 %19, 65
  %sub49 = sub i32 0, %xor48
  %shr50 = lshr i32 %sub49, 8
  %and51 = and i32 %shr50, 255
  %and52 = and i32 %and47, %and51
  %or53 = or i32 %17, %and52
  ret i32 %or53
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
