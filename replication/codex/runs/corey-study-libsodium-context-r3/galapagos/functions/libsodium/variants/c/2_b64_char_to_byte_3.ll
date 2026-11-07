; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r3/functions/libsodium/variants/c/2_b64_char_to_byte_3.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r3/functions/libsodium/variants/c/2_b64_char_to_byte_3.c"
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
  store i32 %not, ptr %upper, align 4
  %3 = load i32, ptr %u, align 4
  %sub2 = sub i32 %3, 97
  %4 = load i32, ptr %u, align 4
  %sub3 = sub i32 122, %4
  %or4 = or i32 %sub2, %sub3
  %shr5 = lshr i32 %or4, 8
  %not6 = xor i32 %shr5, -1
  store i32 %not6, ptr %lower, align 4
  %5 = load i32, ptr %u, align 4
  %sub7 = sub i32 %5, 48
  %6 = load i32, ptr %u, align 4
  %sub8 = sub i32 57, %6
  %or9 = or i32 %sub7, %sub8
  %shr10 = lshr i32 %or9, 8
  %not11 = xor i32 %shr10, -1
  store i32 %not11, ptr %digit, align 4
  %7 = load i32, ptr %upper, align 4
  %8 = load i32, ptr %u, align 4
  %sub12 = sub i32 %8, 65
  %and = and i32 %7, %sub12
  %9 = load i32, ptr %lower, align 4
  %10 = load i32, ptr %u, align 4
  %sub13 = sub i32 %10, 71
  %and14 = and i32 %9, %sub13
  %or15 = or i32 %and, %and14
  %11 = load i32, ptr %digit, align 4
  %12 = load i32, ptr %u, align 4
  %sub16 = sub i32 %12, -4
  %and17 = and i32 %11, %sub16
  %or18 = or i32 %or15, %and17
  %13 = load i32, ptr %u, align 4
  %xor = xor i32 %13, 43
  %sub19 = sub i32 0, %xor
  %shr20 = lshr i32 %sub19, 8
  %not21 = xor i32 %shr20, -1
  %and22 = and i32 %not21, 62
  %or23 = or i32 %or18, %and22
  %14 = load i32, ptr %u, align 4
  %xor24 = xor i32 %14, 47
  %sub25 = sub i32 0, %xor24
  %shr26 = lshr i32 %sub25, 8
  %not27 = xor i32 %shr26, -1
  %and28 = and i32 %not27, 63
  %or29 = or i32 %or23, %and28
  %and30 = and i32 %or29, 255
  store i32 %and30, ptr %x, align 4
  %15 = load i32, ptr %x, align 4
  %16 = load i32, ptr %x, align 4
  %sub31 = sub i32 0, %16
  %shr32 = lshr i32 %sub31, 8
  %not33 = xor i32 %shr32, -1
  %17 = load i32, ptr %u, align 4
  %xor34 = xor i32 %17, 65
  %sub35 = sub i32 0, %xor34
  %shr36 = lshr i32 %sub35, 8
  %and37 = and i32 %not33, %shr36
  %and38 = and i32 %and37, 255
  %or39 = or i32 %15, %and38
  ret i32 %or39
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
