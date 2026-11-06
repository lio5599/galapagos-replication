; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/0_b64_byte_to_char_8.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/0_b64_byte_to_char_8.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_byte_to_char(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_byte_to_char(i32 noundef %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  %a = alloca i8, align 1
  %b = alloca i8, align 1
  %c = alloca i8, align 1
  %d = alloca i8, align 1
  %e = alloca i8, align 1
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %shr = lshr i32 %sub, 8
  %conv = trunc i32 %shr to i8
  store i8 %conv, ptr %a, align 1
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  %shr2 = lshr i32 %sub1, 8
  %conv3 = trunc i32 %shr2 to i8
  store i8 %conv3, ptr %b, align 1
  %2 = load i32, ptr %x.addr, align 4
  %sub4 = sub i32 %2, 62
  %shr5 = lshr i32 %sub4, 8
  %conv6 = trunc i32 %shr5 to i8
  store i8 %conv6, ptr %c, align 1
  %3 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %3, 62
  %sub7 = sub i32 0, %xor
  %shr8 = lshr i32 %sub7, 8
  %conv9 = trunc i32 %shr8 to i8
  %conv10 = zext i8 %conv9 to i32
  %not = xor i32 %conv10, -1
  %conv11 = trunc i32 %not to i8
  store i8 %conv11, ptr %d, align 1
  %4 = load i32, ptr %x.addr, align 4
  %xor12 = xor i32 %4, 63
  %sub13 = sub i32 0, %xor12
  %shr14 = lshr i32 %sub13, 8
  %conv15 = trunc i32 %shr14 to i8
  %conv16 = zext i8 %conv15 to i32
  %not17 = xor i32 %conv16, -1
  %conv18 = trunc i32 %not17 to i8
  store i8 %conv18, ptr %e, align 1
  %5 = load i8, ptr %a, align 1
  %conv19 = zext i8 %5 to i32
  %6 = load i32, ptr %x.addr, align 4
  %add = add i32 %6, 65
  %and = and i32 %conv19, %add
  %7 = load i8, ptr %a, align 1
  %conv20 = zext i8 %7 to i32
  %not21 = xor i32 %conv20, -1
  %conv22 = trunc i32 %not21 to i8
  %conv23 = zext i8 %conv22 to i32
  %8 = load i8, ptr %b, align 1
  %conv24 = zext i8 %8 to i32
  %and25 = and i32 %conv23, %conv24
  %9 = load i32, ptr %x.addr, align 4
  %add26 = add i32 %9, 71
  %and27 = and i32 %and25, %add26
  %or = or i32 %and, %and27
  %10 = load i8, ptr %b, align 1
  %conv28 = zext i8 %10 to i32
  %not29 = xor i32 %conv28, -1
  %conv30 = trunc i32 %not29 to i8
  %conv31 = zext i8 %conv30 to i32
  %11 = load i8, ptr %c, align 1
  %conv32 = zext i8 %11 to i32
  %and33 = and i32 %conv31, %conv32
  %12 = load i32, ptr %x.addr, align 4
  %sub34 = sub i32 %12, 4
  %and35 = and i32 %and33, %sub34
  %or36 = or i32 %or, %and35
  %13 = load i8, ptr %d, align 1
  %conv37 = zext i8 %13 to i32
  %and38 = and i32 %conv37, 43
  %or39 = or i32 %or36, %and38
  %14 = load i8, ptr %e, align 1
  %conv40 = zext i8 %14 to i32
  %and41 = and i32 %conv40, 47
  %or42 = or i32 %or39, %and41
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
