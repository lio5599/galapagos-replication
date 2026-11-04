; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_2.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_2.c"
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
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  store i32 %sub, ptr %a, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  store i32 %sub1, ptr %b, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub2 = sub i32 %2, 62
  store i32 %sub2, ptr %c, align 4
  %3 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %3, 62
  %sub3 = sub i32 0, %xor
  store i32 %sub3, ptr %d, align 4
  %4 = load i32, ptr %x.addr, align 4
  %xor4 = xor i32 %4, 63
  %sub5 = sub i32 0, %xor4
  store i32 %sub5, ptr %e, align 4
  %5 = load i32, ptr %a, align 4
  %shr = lshr i32 %5, 8
  %and = and i32 %shr, 255
  %6 = load i32, ptr %x.addr, align 4
  %add = add i32 %6, 65
  %and6 = and i32 %and, %add
  %7 = load i32, ptr %a, align 4
  %not = xor i32 %7, -1
  %shr7 = lshr i32 %not, 8
  %and8 = and i32 %shr7, 255
  %8 = load i32, ptr %b, align 4
  %shr9 = lshr i32 %8, 8
  %and10 = and i32 %shr9, 255
  %and11 = and i32 %and8, %and10
  %9 = load i32, ptr %x.addr, align 4
  %add12 = add i32 %9, 71
  %and13 = and i32 %and11, %add12
  %or = or i32 %and6, %and13
  %10 = load i32, ptr %b, align 4
  %not14 = xor i32 %10, -1
  %shr15 = lshr i32 %not14, 8
  %and16 = and i32 %shr15, 255
  %11 = load i32, ptr %c, align 4
  %shr17 = lshr i32 %11, 8
  %and18 = and i32 %shr17, 255
  %and19 = and i32 %and16, %and18
  %12 = load i32, ptr %x.addr, align 4
  %add20 = add i32 %12, -4
  %and21 = and i32 %and19, %add20
  %or22 = or i32 %or, %and21
  %13 = load i32, ptr %d, align 4
  %not23 = xor i32 %13, -1
  %shr24 = lshr i32 %not23, 8
  %and25 = and i32 %shr24, 255
  %and26 = and i32 %and25, 45
  %or27 = or i32 %or22, %and26
  %14 = load i32, ptr %e, align 4
  %not28 = xor i32 %14, -1
  %shr29 = lshr i32 %not28, 8
  %and30 = and i32 %shr29, 255
  %and31 = and i32 %and30, 95
  %or32 = or i32 %or27, %and31
  ret i32 %or32
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
