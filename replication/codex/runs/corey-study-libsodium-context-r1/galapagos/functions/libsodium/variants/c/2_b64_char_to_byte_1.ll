; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r1/functions/libsodium/variants/c/2_b64_char_to_byte_1.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r1/functions/libsodium/variants/c/2_b64_char_to_byte_1.c"
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
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %or = or i32 %sub, %sub1
  %not = xor i32 %or, -1
  %shr = lshr i32 %not, 8
  %and = and i32 %shr, 255
  store i32 %and, ptr %a, align 4
  %3 = load i32, ptr %u, align 4
  %sub2 = sub i32 %3, 97
  %4 = load i32, ptr %u, align 4
  %sub3 = sub i32 122, %4
  %or4 = or i32 %sub2, %sub3
  %not5 = xor i32 %or4, -1
  %shr6 = lshr i32 %not5, 8
  %and7 = and i32 %shr6, 255
  store i32 %and7, ptr %b, align 4
  %5 = load i32, ptr %u, align 4
  %sub8 = sub i32 %5, 48
  %6 = load i32, ptr %u, align 4
  %sub9 = sub i32 57, %6
  %or10 = or i32 %sub8, %sub9
  %not11 = xor i32 %or10, -1
  %shr12 = lshr i32 %not11, 8
  %and13 = and i32 %shr12, 255
  store i32 %and13, ptr %d, align 4
  %7 = load i32, ptr %u, align 4
  %xor = xor i32 %7, 43
  %sub14 = sub i32 0, %xor
  %not15 = xor i32 %sub14, -1
  %shr16 = lshr i32 %not15, 8
  %and17 = and i32 %shr16, 255
  store i32 %and17, ptr %p, align 4
  %8 = load i32, ptr %u, align 4
  %xor18 = xor i32 %8, 47
  %sub19 = sub i32 0, %xor18
  %not20 = xor i32 %sub19, -1
  %shr21 = lshr i32 %not20, 8
  %and22 = and i32 %shr21, 255
  store i32 %and22, ptr %s, align 4
  %9 = load i32, ptr %a, align 4
  %10 = load i32, ptr %u, align 4
  %sub23 = sub i32 %10, 65
  %and24 = and i32 %9, %sub23
  %11 = load i32, ptr %b, align 4
  %12 = load i32, ptr %u, align 4
  %sub25 = sub i32 %12, 71
  %and26 = and i32 %11, %sub25
  %or27 = or i32 %and24, %and26
  %13 = load i32, ptr %d, align 4
  %14 = load i32, ptr %u, align 4
  %sub28 = sub i32 %14, -4
  %and29 = and i32 %13, %sub28
  %or30 = or i32 %or27, %and29
  %15 = load i32, ptr %p, align 4
  %and31 = and i32 %15, 62
  %or32 = or i32 %or30, %and31
  %16 = load i32, ptr %s, align 4
  %and33 = and i32 %16, 63
  %or34 = or i32 %or32, %and33
  store i32 %or34, ptr %x, align 4
  %17 = load i32, ptr %x, align 4
  %18 = load i32, ptr %x, align 4
  %sub35 = sub i32 0, %18
  %not36 = xor i32 %sub35, -1
  %19 = load i32, ptr %u, align 4
  %xor37 = xor i32 %19, 65
  %sub38 = sub i32 0, %xor37
  %and39 = and i32 %not36, %sub38
  %shr40 = lshr i32 %and39, 8
  %and41 = and i32 %shr40, 255
  %or42 = or i32 %17, %and41
  ret i32 %or42
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
