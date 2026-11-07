; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r1/functions/libsodium/variants/c/2_b64_char_to_byte_4.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r1/functions/libsodium/variants/c/2_b64_char_to_byte_4.c"
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
  %x = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  store i32 %sub, ptr %a, align 4
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 %2, 97
  store i32 %sub1, ptr %b, align 4
  %3 = load i32, ptr %u, align 4
  %sub2 = sub i32 %3, 48
  store i32 %sub2, ptr %d, align 4
  %4 = load i32, ptr %a, align 4
  %5 = load i32, ptr %a, align 4
  %6 = load i32, ptr %u, align 4
  %sub3 = sub i32 90, %6
  %or = or i32 %5, %sub3
  %shr = lshr i32 %or, 8
  %not = xor i32 %shr, -1
  %and = and i32 %4, %not
  store i32 %and, ptr %a, align 4
  %7 = load i32, ptr %b, align 4
  %add = add i32 %7, 26
  %8 = load i32, ptr %b, align 4
  %9 = load i32, ptr %u, align 4
  %sub4 = sub i32 122, %9
  %or5 = or i32 %8, %sub4
  %shr6 = lshr i32 %or5, 8
  %not7 = xor i32 %shr6, -1
  %and8 = and i32 %add, %not7
  store i32 %and8, ptr %b, align 4
  %10 = load i32, ptr %d, align 4
  %add9 = add i32 %10, 52
  %11 = load i32, ptr %d, align 4
  %12 = load i32, ptr %u, align 4
  %sub10 = sub i32 57, %12
  %or11 = or i32 %11, %sub10
  %shr12 = lshr i32 %or11, 8
  %not13 = xor i32 %shr12, -1
  %and14 = and i32 %add9, %not13
  store i32 %and14, ptr %d, align 4
  %13 = load i32, ptr %a, align 4
  %14 = load i32, ptr %b, align 4
  %or15 = or i32 %13, %14
  %15 = load i32, ptr %d, align 4
  %or16 = or i32 %or15, %15
  %16 = load i32, ptr %u, align 4
  %xor = xor i32 %16, 43
  %sub17 = sub i32 0, %xor
  %shr18 = lshr i32 %sub17, 8
  %not19 = xor i32 %shr18, -1
  %and20 = and i32 %not19, 62
  %or21 = or i32 %or16, %and20
  %17 = load i32, ptr %u, align 4
  %xor22 = xor i32 %17, 47
  %sub23 = sub i32 0, %xor22
  %shr24 = lshr i32 %sub23, 8
  %not25 = xor i32 %shr24, -1
  %and26 = and i32 %not25, 63
  %or27 = or i32 %or21, %and26
  %and28 = and i32 %or27, 255
  store i32 %and28, ptr %x, align 4
  %18 = load i32, ptr %x, align 4
  %19 = load i32, ptr %x, align 4
  %cmp = icmp eq i32 %19, 0
  %conv = zext i1 %cmp to i32
  %sub29 = sub i32 0, %conv
  %20 = load i32, ptr %u, align 4
  %xor30 = xor i32 %20, 65
  %sub31 = sub i32 0, %xor30
  %shr32 = lshr i32 %sub31, 8
  %and33 = and i32 %sub29, %shr32
  %and34 = and i32 %and33, 255
  %or35 = or i32 %18, %and34
  ret i32 %or35
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
