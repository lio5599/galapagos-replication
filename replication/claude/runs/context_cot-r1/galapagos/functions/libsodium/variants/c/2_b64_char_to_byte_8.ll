; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_8.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_8.c"
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
  %ra = alloca i32, align 4
  %rl = alloca i32, align 4
  %rd = alloca i32, align 4
  %rp = alloca i32, align 4
  %rs = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %not = xor i32 %sub, -1
  %shr = lshr i32 %not, 8
  %conv = trunc i32 %shr to i8
  %conv1 = zext i8 %conv to i32
  %2 = load i32, ptr %u, align 4
  %sub2 = sub i32 90, %2
  %not3 = xor i32 %sub2, -1
  %shr4 = lshr i32 %not3, 8
  %conv5 = trunc i32 %shr4 to i8
  %conv6 = zext i8 %conv5 to i32
  %and = and i32 %conv1, %conv6
  %3 = load i32, ptr %u, align 4
  %sub7 = sub i32 %3, 65
  %conv8 = trunc i32 %sub7 to i8
  %conv9 = zext i8 %conv8 to i32
  %and10 = and i32 %and, %conv9
  store i32 %and10, ptr %ra, align 4
  %4 = load i32, ptr %u, align 4
  %sub11 = sub i32 %4, 97
  %not12 = xor i32 %sub11, -1
  %shr13 = lshr i32 %not12, 8
  %conv14 = trunc i32 %shr13 to i8
  %conv15 = zext i8 %conv14 to i32
  %5 = load i32, ptr %u, align 4
  %sub16 = sub i32 122, %5
  %not17 = xor i32 %sub16, -1
  %shr18 = lshr i32 %not17, 8
  %conv19 = trunc i32 %shr18 to i8
  %conv20 = zext i8 %conv19 to i32
  %and21 = and i32 %conv15, %conv20
  %6 = load i32, ptr %u, align 4
  %sub22 = sub i32 %6, 71
  %conv23 = trunc i32 %sub22 to i8
  %conv24 = zext i8 %conv23 to i32
  %and25 = and i32 %and21, %conv24
  store i32 %and25, ptr %rl, align 4
  %7 = load i32, ptr %u, align 4
  %sub26 = sub i32 %7, 48
  %not27 = xor i32 %sub26, -1
  %shr28 = lshr i32 %not27, 8
  %conv29 = trunc i32 %shr28 to i8
  %conv30 = zext i8 %conv29 to i32
  %8 = load i32, ptr %u, align 4
  %sub31 = sub i32 57, %8
  %not32 = xor i32 %sub31, -1
  %shr33 = lshr i32 %not32, 8
  %conv34 = trunc i32 %shr33 to i8
  %conv35 = zext i8 %conv34 to i32
  %and36 = and i32 %conv30, %conv35
  %9 = load i32, ptr %u, align 4
  %add = add i32 %9, 4
  %conv37 = trunc i32 %add to i8
  %conv38 = zext i8 %conv37 to i32
  %and39 = and i32 %and36, %conv38
  store i32 %and39, ptr %rd, align 4
  %10 = load i32, ptr %u, align 4
  %xor = xor i32 %10, 43
  %sub40 = sub i32 0, %xor
  %not41 = xor i32 %sub40, -1
  %shr42 = lshr i32 %not41, 8
  %conv43 = trunc i32 %shr42 to i8
  %conv44 = zext i8 %conv43 to i32
  %and45 = and i32 %conv44, 62
  store i32 %and45, ptr %rp, align 4
  %11 = load i32, ptr %u, align 4
  %xor46 = xor i32 %11, 47
  %sub47 = sub i32 0, %xor46
  %not48 = xor i32 %sub47, -1
  %shr49 = lshr i32 %not48, 8
  %conv50 = trunc i32 %shr49 to i8
  %conv51 = zext i8 %conv50 to i32
  %and52 = and i32 %conv51, 63
  store i32 %and52, ptr %rs, align 4
  %12 = load i32, ptr %ra, align 4
  %13 = load i32, ptr %rl, align 4
  %or = or i32 %12, %13
  %14 = load i32, ptr %rd, align 4
  %or53 = or i32 %or, %14
  %15 = load i32, ptr %rp, align 4
  %or54 = or i32 %or53, %15
  %16 = load i32, ptr %rs, align 4
  %or55 = or i32 %or54, %16
  store i32 %or55, ptr %x, align 4
  %17 = load i32, ptr %x, align 4
  %tobool = icmp ne i32 %17, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %18 = load i32, ptr %x, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %19 = load i32, ptr %u, align 4
  %xor56 = xor i32 %19, 65
  %sub57 = sub i32 0, %xor56
  %shr58 = lshr i32 %sub57, 8
  %conv59 = trunc i32 %shr58 to i8
  %conv60 = zext i8 %conv59 to i32
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %18, %cond.true ], [ %conv60, %cond.false ]
  ret i32 %cond
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
