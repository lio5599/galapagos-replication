; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r2/functions/libsodium/variants/c/2_b64_char_to_byte_9.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r2/functions/libsodium/variants/c/2_b64_char_to_byte_9.c"
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
  %plus = alloca i32, align 4
  %slash = alloca i32, align 4
  %x = alloca i32, align 4
  %correction = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %or = or i32 %sub, %sub1
  %not = xor i32 %or, -1
  %shr = lshr i32 %not, 8
  %3 = load i32, ptr %u, align 4
  %sub2 = sub i32 %3, 65
  %and = and i32 %shr, %sub2
  %and3 = and i32 %and, 255
  store i32 %and3, ptr %upper, align 4
  %4 = load i32, ptr %u, align 4
  %sub4 = sub i32 %4, 97
  %5 = load i32, ptr %u, align 4
  %sub5 = sub i32 122, %5
  %or6 = or i32 %sub4, %sub5
  %not7 = xor i32 %or6, -1
  %shr8 = lshr i32 %not7, 8
  %6 = load i32, ptr %u, align 4
  %sub9 = sub i32 %6, 71
  %and10 = and i32 %shr8, %sub9
  %and11 = and i32 %and10, 255
  store i32 %and11, ptr %lower, align 4
  %7 = load i32, ptr %u, align 4
  %sub12 = sub i32 %7, 48
  %8 = load i32, ptr %u, align 4
  %sub13 = sub i32 57, %8
  %or14 = or i32 %sub12, %sub13
  %not15 = xor i32 %or14, -1
  %shr16 = lshr i32 %not15, 8
  %9 = load i32, ptr %u, align 4
  %sub17 = sub i32 %9, -4
  %and18 = and i32 %shr16, %sub17
  %and19 = and i32 %and18, 255
  store i32 %and19, ptr %digit, align 4
  %10 = load i32, ptr %u, align 4
  %xor = xor i32 %10, 43
  %sub20 = sub i32 0, %xor
  %not21 = xor i32 %sub20, -1
  %shr22 = lshr i32 %not21, 8
  %and23 = and i32 %shr22, 62
  store i32 %and23, ptr %plus, align 4
  %11 = load i32, ptr %u, align 4
  %xor24 = xor i32 %11, 47
  %sub25 = sub i32 0, %xor24
  %not26 = xor i32 %sub25, -1
  %shr27 = lshr i32 %not26, 8
  %and28 = and i32 %shr27, 63
  store i32 %and28, ptr %slash, align 4
  %12 = load i32, ptr %upper, align 4
  %13 = load i32, ptr %lower, align 4
  %or29 = or i32 %12, %13
  %14 = load i32, ptr %digit, align 4
  %15 = load i32, ptr %plus, align 4
  %or30 = or i32 %14, %15
  %16 = load i32, ptr %slash, align 4
  %or31 = or i32 %or30, %16
  %or32 = or i32 %or29, %or31
  store i32 %or32, ptr %x, align 4
  %17 = load i32, ptr %x, align 4
  %sub33 = sub i32 0, %17
  %not34 = xor i32 %sub33, -1
  %18 = load i32, ptr %u, align 4
  %xor35 = xor i32 %18, 65
  %sub36 = sub i32 0, %xor35
  %and37 = and i32 %not34, %sub36
  %shr38 = lshr i32 %and37, 8
  %and39 = and i32 %shr38, 255
  store i32 %and39, ptr %correction, align 4
  %19 = load i32, ptr %x, align 4
  %20 = load i32, ptr %correction, align 4
  %21 = load i32, ptr %x, align 4
  %not40 = xor i32 %21, -1
  %and41 = and i32 %20, %not40
  %xor42 = xor i32 %19, %and41
  ret i32 %xor42
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
