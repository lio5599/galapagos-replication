; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r1/functions/libsodium/variants/c/2_b64_char_to_byte_7.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r1/functions/libsodium/variants/c/2_b64_char_to_byte_7.c"
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
  %correction = alloca i32, align 4
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
  %and = and i32 %not, 255
  %3 = load i32, ptr %u, align 4
  %sub2 = sub i32 %3, 65
  %and3 = and i32 %and, %sub2
  store i32 %and3, ptr %a, align 4
  %4 = load i32, ptr %u, align 4
  %sub4 = sub i32 %4, 97
  %5 = load i32, ptr %u, align 4
  %sub5 = sub i32 122, %5
  %or6 = or i32 %sub4, %sub5
  %shr7 = lshr i32 %or6, 8
  %not8 = xor i32 %shr7, -1
  %and9 = and i32 %not8, 255
  %6 = load i32, ptr %u, align 4
  %sub10 = sub i32 %6, 97
  %add = add i32 %sub10, 26
  %and11 = and i32 %and9, %add
  store i32 %and11, ptr %b, align 4
  %7 = load i32, ptr %u, align 4
  %sub12 = sub i32 %7, 48
  %8 = load i32, ptr %u, align 4
  %sub13 = sub i32 57, %8
  %or14 = or i32 %sub12, %sub13
  %shr15 = lshr i32 %or14, 8
  %not16 = xor i32 %shr15, -1
  %and17 = and i32 %not16, 255
  %9 = load i32, ptr %u, align 4
  %sub18 = sub i32 %9, 48
  %add19 = add i32 %sub18, 52
  %and20 = and i32 %and17, %add19
  store i32 %and20, ptr %d, align 4
  %10 = load i32, ptr %u, align 4
  %xor = xor i32 %10, 43
  %sub21 = sub i32 0, %xor
  %shr22 = lshr i32 %sub21, 8
  %not23 = xor i32 %shr22, -1
  %and24 = and i32 %not23, 62
  store i32 %and24, ptr %p, align 4
  %11 = load i32, ptr %u, align 4
  %xor25 = xor i32 %11, 47
  %sub26 = sub i32 0, %xor25
  %shr27 = lshr i32 %sub26, 8
  %not28 = xor i32 %shr27, -1
  %and29 = and i32 %not28, 63
  store i32 %and29, ptr %s, align 4
  %12 = load i32, ptr %a, align 4
  %13 = load i32, ptr %b, align 4
  %xor30 = xor i32 %12, %13
  %14 = load i32, ptr %a, align 4
  %15 = load i32, ptr %b, align 4
  %and31 = and i32 %14, %15
  %xor32 = xor i32 %xor30, %and31
  store i32 %xor32, ptr %x, align 4
  %16 = load i32, ptr %x, align 4
  %17 = load i32, ptr %d, align 4
  %xor33 = xor i32 %16, %17
  %18 = load i32, ptr %x, align 4
  %19 = load i32, ptr %d, align 4
  %and34 = and i32 %18, %19
  %xor35 = xor i32 %xor33, %and34
  store i32 %xor35, ptr %x, align 4
  %20 = load i32, ptr %x, align 4
  %21 = load i32, ptr %p, align 4
  %xor36 = xor i32 %20, %21
  %22 = load i32, ptr %x, align 4
  %23 = load i32, ptr %p, align 4
  %and37 = and i32 %22, %23
  %xor38 = xor i32 %xor36, %and37
  store i32 %xor38, ptr %x, align 4
  %24 = load i32, ptr %x, align 4
  %25 = load i32, ptr %s, align 4
  %xor39 = xor i32 %24, %25
  %26 = load i32, ptr %x, align 4
  %27 = load i32, ptr %s, align 4
  %and40 = and i32 %26, %27
  %xor41 = xor i32 %xor39, %and40
  store i32 %xor41, ptr %x, align 4
  %28 = load i32, ptr %x, align 4
  %sub42 = sub i32 0, %28
  %shr43 = lshr i32 %sub42, 8
  %not44 = xor i32 %shr43, -1
  %29 = load i32, ptr %u, align 4
  %xor45 = xor i32 %29, 65
  %sub46 = sub i32 0, %xor45
  %shr47 = lshr i32 %sub46, 8
  %and48 = and i32 %not44, %shr47
  %and49 = and i32 %and48, 255
  store i32 %and49, ptr %correction, align 4
  %30 = load i32, ptr %x, align 4
  %31 = load i32, ptr %correction, align 4
  %xor50 = xor i32 %30, %31
  %32 = load i32, ptr %x, align 4
  %33 = load i32, ptr %correction, align 4
  %and51 = and i32 %32, %33
  %xor52 = xor i32 %xor50, %and51
  ret i32 %xor52
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
