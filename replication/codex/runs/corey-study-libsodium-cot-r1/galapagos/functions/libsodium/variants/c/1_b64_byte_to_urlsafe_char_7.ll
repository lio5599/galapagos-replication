; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r1/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_7.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r1/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_7.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_byte_to_urlsafe_char(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_byte_to_urlsafe_char(i32 noundef %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  %u = alloca i32, align 4
  %v = alloca i32, align 4
  %w = alloca i32, align 4
  %p = alloca i32, align 4
  %q = alloca i32, align 4
  %upper = alloca i32, align 4
  %lower = alloca i32, align 4
  %digit = alloca i32, align 4
  %dash = alloca i32, align 4
  %underscore = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  store i32 %sub, ptr %u, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  store i32 %sub1, ptr %v, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub2 = sub i32 %2, 62
  store i32 %sub2, ptr %w, align 4
  %3 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %3, 62
  %sub3 = sub i32 0, %xor
  store i32 %sub3, ptr %p, align 4
  %4 = load i32, ptr %x.addr, align 4
  %xor4 = xor i32 %4, 63
  %sub5 = sub i32 0, %xor4
  store i32 %sub5, ptr %q, align 4
  %5 = load i32, ptr %u, align 4
  %shr = lshr i32 %5, 8
  %6 = load i32, ptr %x.addr, align 4
  %add = add i32 %6, 65
  %and = and i32 %shr, %add
  store i32 %and, ptr %upper, align 4
  %7 = load i32, ptr %u, align 4
  %not = xor i32 %7, -1
  %shr6 = lshr i32 %not, 8
  %8 = load i32, ptr %v, align 4
  %shr7 = lshr i32 %8, 8
  %and8 = and i32 %shr6, %shr7
  %9 = load i32, ptr %x.addr, align 4
  %add9 = add i32 %9, 71
  %and10 = and i32 %and8, %add9
  store i32 %and10, ptr %lower, align 4
  %10 = load i32, ptr %v, align 4
  %not11 = xor i32 %10, -1
  %shr12 = lshr i32 %not11, 8
  %11 = load i32, ptr %w, align 4
  %shr13 = lshr i32 %11, 8
  %and14 = and i32 %shr12, %shr13
  %12 = load i32, ptr %x.addr, align 4
  %add15 = add i32 %12, -4
  %and16 = and i32 %and14, %add15
  store i32 %and16, ptr %digit, align 4
  %13 = load i32, ptr %p, align 4
  %not17 = xor i32 %13, -1
  %shr18 = lshr i32 %not17, 8
  %and19 = and i32 %shr18, 45
  store i32 %and19, ptr %dash, align 4
  %14 = load i32, ptr %q, align 4
  %not20 = xor i32 %14, -1
  %shr21 = lshr i32 %not20, 8
  %and22 = and i32 %shr21, 95
  store i32 %and22, ptr %underscore, align 4
  %15 = load i32, ptr %upper, align 4
  %16 = load i32, ptr %lower, align 4
  %or = or i32 %15, %16
  %17 = load i32, ptr %digit, align 4
  %or23 = or i32 %or, %17
  %18 = load i32, ptr %dash, align 4
  %or24 = or i32 %or23, %18
  %19 = load i32, ptr %underscore, align 4
  %or25 = or i32 %or24, %19
  %and26 = and i32 %or25, 255
  ret i32 %and26
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
